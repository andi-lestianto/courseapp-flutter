import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/modules/course/widget/modifycourse_dialog.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
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
                child: _.listCourse.reqStatus == ReqStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorTheme.mainBlue,
                        ),
                      )
                    : _.listCourse.reqStatus == ReqStatus.done
                        ? _.filteredCourse.isNotEmpty
                            ? ListView.builder(
                                padding: EdgeInsets.only(top: 10.w),
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _.filteredCourse.length,
                                itemBuilder: (context, index) =>
                                    DataContainerWidget(
                                  uniqId: index.toString(),
                                  title: _.filteredCourse[index].namaMatkul
                                      .toString(),
                                  subtitle:
                                      '${_.filteredCourse[index].nama_dosen.toString()}/${_.filteredCourse[index].jmlSks.toString()}/${_.filteredCourse[index].semester.toString()}',
                                  onEdit: () {
                                    ModifyCourseDialog().show(context,
                                        isAdd: false,
                                        idcourse: _
                                            .filteredCourse[index].idMatkul
                                            .toString());
                                    _.clearTextField();
                                    _.fillTextField(_.filteredCourse[index]);
                                  },
                                  onDelete: () {
                                    _.deleteCourse(_
                                        .filteredCourse[index].idMatkul
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
                                    itemCount: _.listCourse.data!.length,
                                    itemBuilder: (context, index) =>
                                        DataContainerWidget(
                                      uniqId: index.toString(),
                                      title: _
                                          .listCourse.data![index].namaMatkul
                                          .toString(),
                                      subtitle:
                                          '${_.listCourse.data![index].nama_dosen.toString()}/${_.listCourse.data![index].jmlSks.toString()}/${_.listCourse.data![index].semester.toString()}',
                                      onEdit: () {
                                        ModifyCourseDialog().show(context,
                                            isAdd: false,
                                            idcourse: _.listCourse.data![index]
                                                .idMatkul
                                                .toString());
                                        _.clearTextField();
                                        _.fillTextField(
                                            _.listCourse.data![index]);
                                      },
                                      onDelete: () {
                                        _.deleteCourse(_
                                            .listCourse.data![index].idMatkul
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
            ModifyCourseDialog().show(context, isAdd: true);
            _.clearTextField();
          })),
    );
  }
}
