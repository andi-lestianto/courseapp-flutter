import 'package:courseapp/app/helper/mainnavigation_helper.dart';
import 'package:courseapp/app/model/page_model.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavigationWidget extends StatelessWidget {
  final String currentRoute;
  final PageModel? data;
  const NavigationWidget(
      {super.key, required this.data, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data != null && currentRoute != data!.routes) {
          MainNavigation.homeNav.currentState!
              .pushReplacementNamed(data!.routes);
          Get.back();
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Konfirmasi',
                  style: FontTheme.semibold
                      .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
                ),
                content: Text(
                  'Yakin ingin keluar aplikasi?',
                  style: FontTheme.base
                      .copyWith(fontSize: 14.sp, color: ColorTheme.darkGray),
                ),
                actions: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorTheme.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          )),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text('Ya')),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorTheme.mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        )),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Tidak'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 5.w,
                    decoration: BoxDecoration(
                        color: (data != null && currentRoute == data!.routes)
                            ? ColorTheme.mainBlue
                            : Colors.transparent),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: ColorTheme.whiteGray))),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 10.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            data != null
                                ? data!.iconPath
                                : 'assets/icon/ic-exit.svg',
                            width: 24.w,
                            height: 24.w,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Text(
                            data != null ? data!.label : 'Keluar',
                            style: FontTheme.medium.copyWith(
                                color: ColorTheme.gray, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
