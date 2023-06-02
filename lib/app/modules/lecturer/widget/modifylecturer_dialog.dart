import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModifyLecturerDialog {
  show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
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
                'Edit Data Dosen',
                style: FontTheme.semibold
                    .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
              ),
              SizedBox(
                height: 18.w,
              ),
              TextFieldWidget(
                  label: 'NIDN',
                  textEditingController: TextEditingController()),
              SizedBox(
                height: 18.w,
              ),
              TextFieldWidget(
                  label: 'NIDN',
                  textEditingController: TextEditingController()),
              SizedBox(
                height: 18.w,
              ),
              TextFieldWidget(
                  label: 'NIDN',
                  textEditingController: TextEditingController()),
              SizedBox(
                height: 18.w,
              ),
              TextFieldWidget(
                  label: 'NIDN',
                  textEditingController: TextEditingController()),
              SizedBox(
                height: 18.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
