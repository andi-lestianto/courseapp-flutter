import 'package:courseapp/app/helper/typedef_helper.dart';
import 'package:courseapp/app/modules/home/controllers/home_controller.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  final TextEditingController textEditingController;
  final MyValueCallback<String> onChanged;
  final String label;
  const CustomAppBar(
      {super.key,
      required this.label,
      required this.textEditingController,
      required this.onChanged});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool showsearch = false;

  setShowSearch() {
    setState(() {
      showsearch = !showsearch;
      widget.textEditingController.clear();
      widget.onChanged('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 60.w,
        decoration: BoxDecoration(color: ColorTheme.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 12,
              spreadRadius: 0,
              color: ColorTheme.black.withOpacity(0.04))
        ]),
        child: Row(
          children: [
            InkWell(
              onTap: () => _.scaffoldKey.currentState!.openDrawer(),
              child: SvgPicture.asset(
                'assets/icon/ic-menu.svg',
                height: 24.w,
                width: 24.w,
              ),
            ),
            Expanded(
              child: showsearch
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.w),
                            child: TextField(
                              controller: widget.textEditingController,
                              textInputAction: TextInputAction.done,
                              style: FontTheme.base.copyWith(fontSize: 12.sp),
                              decoration: InputDecoration(
                                  hintText: 'Ketikkan keyword disini',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  suffixIconConstraints: BoxConstraints(
                                      minHeight: 24.w, minWidth: 24.w),
                                  filled: true,
                                  fillColor: ColorTheme.whiteGray,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(8.r))),
                              onChanged: (value) {
                                widget.onChanged(value);
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setShowSearch();
                          },
                          child: SvgPicture.asset(
                            'assets/icon/ic-close.svg',
                            height: 24.w,
                            width: 24.w,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(widget.label,
                                style: FontTheme.semibold.copyWith(
                                  color: ColorTheme.darkGray,
                                  fontSize: 20.sp,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setShowSearch();
                          },
                          child: SvgPicture.asset(
                            'assets/icon/ic-search.svg',
                            height: 24.w,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
