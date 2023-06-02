import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/networkimage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataContainerWidget extends StatelessWidget {
  final bool? showProfilePict;
  final Function onEdit;
  const DataContainerWidget(
      {super.key, this.showProfilePict = true, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: ColorTheme.whiteGray))),
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          if (showProfilePict == true)
            Row(
              children: [
                SizedBox(
                    height: 60.w, width: 60.w, child: NetworkImageWidget()),
                SizedBox(
                  width: 12.w,
                ),
              ],
            ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Andi Lestianto',
                style: FontTheme.semibold
                    .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
              ),
              Text(
                'Karanganyar',
                style: FontTheme.regular
                    .copyWith(color: ColorTheme.darkGray, fontSize: 12.sp),
              ),
            ],
          )),
          InkWell(
            onTap: () {
              onEdit();
            },
            child: SvgPicture.asset(
              'assets/icon/ic-edit.svg',
              width: 24.w,
              height: 24.w,
            ),
          )
        ],
      ),
    );
  }
}
