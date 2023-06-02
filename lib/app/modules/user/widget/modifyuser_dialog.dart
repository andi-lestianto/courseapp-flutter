import 'package:courseapp/app/modules/user/controllers/user_controller.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/custombtn_widget.dart';
import 'package:courseapp/app/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ModifyUserDialog {
  show(BuildContext context, {required bool isAdd}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => GetBuilder<UserController>(
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
                  (isAdd ? 'Tambah' : 'Edit') + ' Data Pengguna',
                  style: FontTheme.semibold
                      .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    label: 'Nama', textEditingController: _.nameController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    label: 'Email', textEditingController: _.emailController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    isPassword: true,
                    label: 'Password',
                    textEditingController: _.passController),
                SizedBox(
                  height: 18.w,
                ),
                TextFieldWidget(
                    isPassword: true,
                    label: 'Konfirmasi Password',
                    textEditingController: _.confirmPassController),
                SizedBox(
                  height: 18.w,
                ),
                CustomBtnWidget(label: 'Simpan', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
