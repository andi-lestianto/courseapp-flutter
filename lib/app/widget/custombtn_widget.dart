import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtnWidget extends StatelessWidget {
  final String label;
  final Function onPressed;
  const CustomBtnWidget(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.w,
        width: 1.sw,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                backgroundColor: ColorTheme.mainBlue),
            onPressed: () {
              onPressed();
            },
            child: Text(label,
                style: FontTheme.extrabold.copyWith(
                  color: ColorTheme.white,
                  fontSize: 16.sp,
                ))));
  }
}
