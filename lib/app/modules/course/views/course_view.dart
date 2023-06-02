import 'package:courseapp/app/modules/course/widget/modifycourse_dialog.dart';
import 'package:courseapp/app/widget/customappbar_widget.dart';
import 'package:courseapp/app/widget/datacontainer_widget.dart';
import 'package:courseapp/app/widget/fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/course_controller.dart';

class CourseView extends GetView<CourseController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseController>(
      init: CourseController(),
      builder: (_) => Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                  textEditingController: _.searchController,
                  onChanged: (value) {
                    print(value);
                  },
                  label: 'Data Mata Kuliah'),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.w),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => DataContainerWidget(
                          uniqId: index.toString(),
                          title: 'Andi Lestianto',
                          subtitle: 'haha',
                          showProfilePict: false,
                          onEdit: () {
                            ModifyCourseDialog().show(context, isAdd: false);
                          },
                          onDelete: () {},
                        )),
              )
            ],
          ),
          floatingActionButton: FabWidget(onPressed: () {
            ModifyCourseDialog().show(context, isAdd: true);
          })),
    );
  }
}
