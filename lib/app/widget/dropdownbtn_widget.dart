import 'package:courseapp/app/helper/typedef_helper.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropdownBtnWidget extends StatelessWidget {
  final String label;
  final List<String> data;
  final MyValueCallback<String> onSelected;
  final String selectedValue;
  const DropdownBtnWidget({
    super.key,
    required this.label,
    required this.data,
    required this.onSelected,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FontTheme.regular
              .copyWith(fontSize: 12.sp, color: ColorTheme.darkGray),
        ),
        SizedBox(
          height: 8.w,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: ColorTheme.whiteGray,
                borderRadius: BorderRadius.circular(8.r)),
            height: 50.w,
            child: Center(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedValue,
                icon: SvgPicture.asset('assets/icon/ic-arrowdown.svg'),
                elevation: 16,
                style: FontTheme.base
                    .copyWith(fontSize: 12.sp, color: ColorTheme.black),
                underline: SizedBox(),
                onChanged: (String? value) {
                  onSelected(value!);
                },
                items: data.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ))
      ],
    );
  }
}
