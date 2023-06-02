import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/networkimage_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataContainerWidget extends StatelessWidget {
  final String uniqId;
  final String title;
  final String subtitle;
  final bool? showProfilePict;
  final Function onEdit;
  final Function onDelete;
  const DataContainerWidget(
      {super.key,
      this.showProfilePict = true,
      required this.onEdit,
      required this.title,
      required this.subtitle,
      required this.uniqId,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(int.parse(uniqId.toString())),
      background: Container(
        color: ColorTheme.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hapus Data',
              style: FontTheme.medium
                  .copyWith(color: ColorTheme.white, fontSize: 14.sp),
            ),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.delete,
              color: ColorTheme.white,
              size: 20.sp,
            )
          ],
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Konfirmasi',
                style: FontTheme.semibold
                    .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
              ),
              content: Text(
                'Yakin ingin mengapus data',
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
                      Navigator.of(context).pop(true);
                      onDelete();
                    },
                    child: const Text('Hapus')),
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
                  child: const Text('Batal'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
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
                  title,
                  style: FontTheme.semibold
                      .copyWith(color: ColorTheme.darkGray, fontSize: 16.sp),
                ),
                Text(
                  subtitle,
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
      ),
    );
  }
}
