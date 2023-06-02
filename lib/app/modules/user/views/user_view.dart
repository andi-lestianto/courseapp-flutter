import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/modules/user/widget/modifyuser_dialog.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/customappbar_widget.dart';
import 'package:courseapp/app/widget/datacontainer_widget.dart';
import 'package:courseapp/app/widget/fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (_) => Scaffold(
        body: Column(
          children: [
            CustomAppBar(
                textEditingController: _.searchController,
                onChanged: (value) {
                  _.searchUser();
                },
                label: 'Data Pengguna'),
            Expanded(
              child: _.listUser.reqStatus == ReqStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorTheme.mainBlue,
                      ),
                    )
                  : _.listUser.reqStatus == ReqStatus.done
                      ? _.filteredUser.isNotEmpty
                          ? ListView.builder(
                              padding: EdgeInsets.only(top: 10.w),
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _.filteredUser.length,
                              itemBuilder: (context, index) =>
                                  DataContainerWidget(
                                uniqId: index.toString(),
                                title: _.filteredUser[index].name.toString(),
                                imgUrl: _.filteredUser[index].pict,
                                subtitle:
                                    _.filteredUser[index].email.toString(),
                                onEdit: () {
                                  ModifyUserDialog().show(context,
                                      isAdd: false,
                                      idUser: _.filteredUser[index].iduser
                                          .toString());
                                  _.clearTextField();
                                  _.fillTextField(_.filteredUser[index]);
                                },
                                onDelete: () {
                                  _.deleteUser(
                                      _.filteredUser[index].iduser.toString());
                                },
                              ),
                            )
                          : _.searchController.text != ''
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: LottieBuilder.asset(
                                        'assets/lottie/lottie-failed.json',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.w,
                                    ),
                                    Text(
                                      'Data tidak ditemukan',
                                      style: FontTheme.base.copyWith(
                                        fontSize: 12,
                                        color: ColorTheme.darkGray,
                                      ),
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.only(top: 10.w),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _.listUser.data!.length,
                                  itemBuilder: (context, index) =>
                                      DataContainerWidget(
                                    uniqId: index.toString(),
                                    title:
                                        _.listUser.data![index].name.toString(),
                                    subtitle: _.listUser.data![index].email
                                        .toString(),
                                    imgUrl: _.listUser.data![index].pict,
                                    onEdit: () {
                                      ModifyUserDialog().show(context,
                                          isAdd: false,
                                          idUser: _.listUser.data![index].iduser
                                              .toString());
                                      _.clearTextField();
                                      _.fillTextField(_.listUser.data![index]);
                                    },
                                    onDelete: () {
                                      _.deleteUser(_
                                          .listUser.data![index].iduser
                                          .toString());
                                    },
                                  ),
                                )
                      : Center(
                          child: Text(
                          'Tidak ada data',
                          style: FontTheme.base.copyWith(
                            fontSize: 12,
                            color: ColorTheme.darkGray,
                          ),
                        )),
            )
          ],
        ),
        floatingActionButton: FabWidget(onPressed: () {
          ModifyUserDialog().show(context, isAdd: true);
          _.clearTextField();
        }),
      ),
    );
  }
}
