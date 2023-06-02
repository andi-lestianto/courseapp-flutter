import 'package:courseapp/app/routes/app_pages.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/custombtn_widget.dart';
import 'package:courseapp/app/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (_) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenUtil().statusBarHeight,
                ),
                SizedBox(
                  height: 36.w,
                ),
                SizedBox(
                  width: 280.w,
                  child: LottieBuilder.asset(
                    'assets/lottie/lottie-signin.json',
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  'Selamat Datang',
                  style: FontTheme.semibold
                      .copyWith(fontSize: 24.sp, color: ColorTheme.darkGray),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  'Silahkan login untuk melanjutkan ke aplikasi',
                  style: FontTheme.regular
                      .copyWith(fontSize: 12.sp, color: ColorTheme.darkGray),
                ),
                SizedBox(
                  height: 32.w,
                ),
                TextFieldWidget(
                    label: 'Email', textEditingController: _.emailController),
                SizedBox(
                  height: 12.w,
                ),
                TextFieldWidget(
                  label: 'Password',
                  textEditingController: _.passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 32.w,
                ),
                CustomBtnWidget(
                    label: 'Login',
                    onPressed: () {
                      Get.offAllNamed(Routes.HOME);
                    }),
                SizedBox(
                  height: 32.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
