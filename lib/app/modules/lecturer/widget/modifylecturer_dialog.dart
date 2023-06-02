import 'package:courseapp/app/modules/lecturer/controllers/lecturer_controller.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/custombtn_widget.dart';
import 'package:courseapp/app/widget/textfield_widget.dart';
import 'package:courseapp/app/widget/dropdownbtn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ModifyLecturerDialog {
  show(BuildContext context, {required bool isAdd}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => GetBuilder<LecturerController>(
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
                  (isAdd ? 'Tambah' : 'Edit') + ' Data Dosen',
                  style: FontTheme.semibold
                      .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    isDisable: isAdd ? false : true,
                    label: 'NIDN',
                    textEditingController: _.nidnController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    label: 'Nama Dosen',
                    textEditingController: _.nameController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    label: 'Alamat', textEditingController: _.alamatController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    label: 'Tanggal Lahir',
                    isDatePicker: true,
                    textEditingController: _.tanggalController),
                SizedBox(
                  height: 18.w,
                ),
                DropdownBtnWidget(
                    label: 'Jenis Kelamin',
                    data: ['Laki - Laki', 'Perempuan'],
                    selectedValue: _.selectedJenkel,
                    onSelected: (value) {
                      _.updateJenkel(value);
                    }),
                SizedBox(
                  height: 18.w,
                ),
                CustomBtnWidget(
                    label: 'Simpan',
                    onPressed: () {
                      if (isAdd) {
                        _.insertLecturer();
                      } else {
                        _.updateLecturer();
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
