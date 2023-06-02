import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/modules/lecturer/widget/modifylecturer_dialog.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/customappbar_widget.dart';
import 'package:courseapp/app/widget/datacontainer_widget.dart';
import 'package:courseapp/app/widget/fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/lecturer_controller.dart';

class LecturerView extends GetView<LecturerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LecturerController>(
      init: LecturerController(),
      builder: (_) => Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                  textEditingController: _.searchController,
                  onChanged: (value) {
                    _.searchLecturer();
                  },
                  label: 'Data Dosen'),
              Expanded(
                child: _.listLecturer.reqStatus == ReqStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorTheme.mainBlue,
                        ),
                      )
                    : _.listLecturer.reqStatus == ReqStatus.done
                        ? _.filteredLecturer.isNotEmpty
                            ? ListView.builder(
                                padding: EdgeInsets.only(top: 10.w),
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _.filteredLecturer.length,
                                itemBuilder: (context, index) =>
                                    DataContainerWidget(
                                  uniqId: index.toString(),
                                  title: _.filteredLecturer[index].namaDosen
                                      .toString(),
                                  subtitle: _.filteredLecturer[index].alamat
                                      .toString(),
                                  onEdit: () {
                                    ModifyLecturerDialog().show(
                                      context,
                                      isAdd: false,
                                    );
                                    _.fillTextField(_.filteredLecturer[index]);
                                  },
                                  onDelete: () {
                                    _.deleteLecturer(_
                                        .filteredLecturer[index].nidn
                                        .toString());
                                  },
                                ),
                              )
                            : _.searchController.text != ''
                                ? Center(
                                    child: Text(
                                    'Data tidak ditemukan',
                                    style: FontTheme.base.copyWith(
                                      fontSize: 12,
                                      color: ColorTheme.darkGray,
                                    ),
                                  ))
                                : ListView.builder(
                                    padding: EdgeInsets.only(top: 10.w),
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _.listLecturer.data!.length,
                                    itemBuilder: (context, index) =>
                                        DataContainerWidget(
                                      uniqId: index.toString(),
                                      title: _
                                          .listLecturer.data![index].namaDosen
                                          .toString(),
                                      subtitle: _
                                          .listLecturer.data![index].alamat
                                          .toString(),
                                      onEdit: () {
                                        ModifyLecturerDialog().show(
                                          context,
                                          isAdd: false,
                                        );
                                        _.fillTextField(
                                            _.listLecturer.data![index]);
                                      },
                                      onDelete: () {
                                        _.deleteLecturer(_
                                            .listLecturer.data![index].nidn
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
            ModifyLecturerDialog().show(context, isAdd: true);
            _.clearTextField();
          })),
    );
  }
}
