import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final bool? numberOnly;
  final bool? isDisable;
  final bool? isPassword;
  final bool? isDatePicker;
  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.textEditingController,
      this.isPassword,
      this.isDatePicker,
      this.isDisable,
      this.numberOnly});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool obsecureTxt = true;

  changeObsecureTxt() {
    setState(() {
      obsecureTxt = !obsecureTxt;
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
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50.w,
                child: TextField(
                  inputFormatters: widget.numberOnly == true
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : [],
                  keyboardType:
                      widget.numberOnly == true ? TextInputType.number : null,
                  readOnly:
                      widget.isDatePicker == true || widget.isDisable == true
                          ? true
                          : false,
                  obscureText: widget.isPassword == true ? obsecureTxt : false,
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
                                child: SvgPicture.asset(obsecureTxt
                                    ? 'assets/icon/ic-eyeslash.svg'
                                    : 'assets/icon/ic-eye.svg'),
                              ))
                          : null,
                      filled: true,
                      fillColor: widget.isDisable == true
                          ? ColorTheme.gray
                          : ColorTheme.whiteGray,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r))),
                ),
              ),
            ),
            if (widget.isDatePicker == true)
              Row(
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then(
                        (date) {
                          if (date != null) {
                            widget.textEditingController.text =
                                date.toString().split(' ').first;
                          }
                        },
                      );
                    },
                    child: Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorTheme.whiteGray),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icon/ic-calendar.svg',
                          height: 24.w,
                          width: 24.w,
                        ),
                      ),
                    ),
                  )
                ],
              )
          ],
        )
      ],
    );
  }
}
