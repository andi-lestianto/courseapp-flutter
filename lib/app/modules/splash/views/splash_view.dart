import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Container(
          width: 1.sw,
          decoration: BoxDecoration(color: ColorTheme.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/courseapplogo.png',
                height: 150.w,
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(
                'COURSE APP',
                style: FontTheme.black
                    .copyWith(fontSize: 26.sp, color: ColorTheme.mainBlue),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: ColorTheme.white),
            height: 50.w,
            child: Center(
                child: Text(
              'Powered by Andi Lestianto',
              style: FontTheme.light
                  .copyWith(fontSize: 10.sp, color: ColorTheme.darkGray),
            ))),
      ),
    );
  }
}
