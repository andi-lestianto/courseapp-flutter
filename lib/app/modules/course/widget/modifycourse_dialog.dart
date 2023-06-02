import 'package:courseapp/app/modules/course/controllers/course_controller.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/custombtn_widget.dart';
import 'package:courseapp/app/widget/textfield_widget.dart';
import 'package:courseapp/app/widget/dropdownbtn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ModifyCourseDialog {
  show(BuildContext context, {required bool isAdd, String? idcourse}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => GetBuilder<CourseController>(
        builder: (_) => Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              color: ColorTheme.white),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (isAdd ? 'Tambah' : 'Edit') + ' Data Mata Kuliah',
                  style: FontTheme.semibold
                      .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    isDisable: isAdd ? false : true,
                    label: 'ID Mata Kuliah',
                    textEditingController: _.idController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    label: 'Nama Mata Kuliah',
                    textEditingController: _.nameController),
                SizedBox(
                  height: 18.w,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                          numberOnly: true,
                          label: 'Jumlah SKS',
                          textEditingController: _.sksController),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: TextFieldWidget(
                          numberOnly: true,
                          label: 'Semester',
                          textEditingController: _.semesterController),
                    )
                  ],
                ),
                SizedBox(
                  height: 18.w,
                ),
                DropdownBtnWidget(
                    label: 'Jenis Kelamin',
                    data: _.lecturerData,
                    selectedValue: _.selectedLecturer.toString(),
                    onSelected: (value) {
                      _.updateLecturer(value);
                    }),
                SizedBox(
                  height: 18.w,
                ),
                _.btnLoading
                    ? SizedBox(
                        height: 50.w,
                        width: 1.sw,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorTheme.mainBlue,
                          ),
                        ),
                      )
                    : CustomBtnWidget(
                        label: 'Simpan',
                        onPressed: () {
                          if (isAdd) {
                            _.insertCourse();
                          } else {
                            _.updateCourse(idcourse.toString());
                          }
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
