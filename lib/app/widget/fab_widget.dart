import 'package:courseapp/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FabWidget extends StatelessWidget {
  final Function onPressed;
  const FabWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: ColorTheme.white,
        elevation: 0,
        onPressed: () {
          onPressed();
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.w),
                color: ColorTheme.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                      blurRadius: 12,
                      color: ColorTheme.black.withOpacity(0.10))
                ]),
            child: SvgPicture.asset('assets/icon/ic-add.svg')));
  }
}
