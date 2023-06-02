import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final bool? isPassword;
  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.textEditingController,
      this.isPassword});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool showPass = false;

  changeObsecureTxt() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: FontTheme.regular
              .copyWith(fontSize: 12.sp, color: ColorTheme.darkGray),
        ),
        SizedBox(
          height: 8.w,
        ),
        TextField(
          obscureText: showPass,
          controller: widget.textEditingController,
          style: FontTheme.base.copyWith(fontSize: 12.sp),
          decoration: InputDecoration(
              suffixIconConstraints:
                  BoxConstraints(minHeight: 24.w, minWidth: 24.w),
              suffixIcon: widget.isPassword == true
                  ? Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: InkWell(
                        onTap: () => changeObsecureTxt(),
                        child: SvgPicture.asset(showPass
                            ? 'assets/icon/ic-eyeslash.svg'
                            : 'assets/icon/ic-eye.svg'),
                      ))
                  : null,
              filled: true,
              fillColor: ColorTheme.whiteGray,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.r))),
        )
      ],
    );
  }
}
