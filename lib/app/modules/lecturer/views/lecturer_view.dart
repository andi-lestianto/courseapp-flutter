import 'package:courseapp/app/helper/mainnavigation_helper.dart';
import 'package:courseapp/app/modules/lecturer/widget/modifylecturer_dialog.dart';
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
                  onSubmit: (value) {
                    print(value);
                  },
                  label: 'Data Dosen'),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.w),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => DataContainerWidget()),
              )
            ],
          ),
          floatingActionButton: FabWidget(onPressed: () {
            ModifyLecturerDialog().show(context);
          })),
    );
  }
}
