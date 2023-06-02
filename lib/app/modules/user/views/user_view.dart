import 'package:courseapp/app/modules/user/widget/modifyuser_dialog.dart';
import 'package:courseapp/app/widget/customappbar_widget.dart';
import 'package:courseapp/app/widget/datacontainer_widget.dart';
import 'package:courseapp/app/widget/fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
                onSubmit: (value) {
                  print(value);
                },
                label: 'Data Pengguna'),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.w),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => DataContainerWidget(
                        onEdit: () {
                          ModifyUserDialog().show(context, isAdd: false);
                        },
                      )),
            )
          ],
        ),
        floatingActionButton: FabWidget(onPressed: () {
          ModifyUserDialog().show(context, isAdd: true);
        }),
      ),
    );
  }
}
