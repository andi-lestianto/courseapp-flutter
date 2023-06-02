import 'package:courseapp/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Toast {
  showAlert({required String title, required String message}) {
    Get.snackbar(title, message,
        boxShadows: [
          BoxShadow(
              color: ColorTheme.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 4,
              offset: const Offset(2, 2))
        ],
        backgroundColor: ColorTheme.red,
        colorText: ColorTheme.white,
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(20.w),
        duration: const Duration(milliseconds: 3000));
  }

  showSuccess({required String title, required String message}) {
    Get.snackbar(title, message,
        boxShadows: [
          BoxShadow(
              color: ColorTheme.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 4,
              offset: const Offset(2, 2))
        ],
        backgroundColor: ColorTheme.mainBlue,
        colorText: ColorTheme.white,
        icon: const Icon(Icons.done, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(20.w),
        duration: const Duration(milliseconds: 3000));
  }
}
