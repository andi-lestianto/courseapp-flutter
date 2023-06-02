import 'package:courseapp/app/helper/mainnavigation_helper.dart';
import 'package:courseapp/app/model/page_model.dart';
import 'package:courseapp/app/modules/course/views/course_view.dart';
import 'package:courseapp/app/modules/lecturer/views/lecturer_view.dart';
import 'package:courseapp/app/modules/user/views/user_view.dart';
import 'package:courseapp/app/routes/app_pages.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:courseapp/app/theme/font_theme.dart';
import 'package:courseapp/app/widget/navigation_widget.dart';
import 'package:courseapp/app/widget/networkimage_widget.dart';
import 'package:courseapp/app/widget/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => WillPopScope(
        onWillPop: () async {
          if (_.scaffoldKey.currentState!.isDrawerOpen) {
            return true;
          } else {
            if (MainNavigation.homeNav.currentState!.canPop()) {
              print('object');
              MainNavigation.homeNav.currentState!.maybePop();
              return false;
            }
            DateTime now = DateTime.now();
            if (now.difference(_.currentBackPressTime) > Duration(seconds: 2)) {
              _.setCurrentBackPressTime(now);
              Toast().showAlert(
                  title: 'Alert', message: 'Ketuk 2x untuk keluar aplikasi');
              return false;
            }
            return true;
          }
        },
        child: Scaffold(
          key: _.scaffoldKey,
          body: Column(
            children: [
              SizedBox(
                height: ScreenUtil().statusBarHeight,
              ),
              Expanded(
                child: Navigator(
                  key: MainNavigation.homeNav,
                  initialRoute: '/',
                  onGenerateRoute: (settings) {
                    Widget page;
                    _.setCurrentRoute(settings.name.toString());
                    switch (settings.name) {
                      case Routes.LECTURER:
                        page = LecturerView();
                        break;
                      case Routes.COURSE:
                        page = CourseView();
                        break;
                      case Routes.USER:
                        page = UserView();
                        break;

                      default:
                        page = LecturerView();
                        break;
                    }

                    return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page,
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 500));
                  },
                ),
              ),
            ],
          ),
          drawer: Container(
            width: 1.sw * 0.75,
            decoration: BoxDecoration(color: ColorTheme.white),
            child: Column(
              children: [
                SizedBox(
                  height: 260.w,
                  child: Stack(
                    children: [
                      Container(
                        height: 125.w,
                        decoration: BoxDecoration(color: ColorTheme.mainBlue),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: ScreenUtil().statusBarHeight,
                          ),
                          SizedBox(
                            height: 40.w,
                          ),
                          Center(
                            child: SizedBox(
                                height: 125.w,
                                width: 125.w,
                                child: NetworkImageWidget()),
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                          Text(
                            'Andi Lestianto',
                            style: FontTheme.semibold.copyWith(
                                color: ColorTheme.darkGray, fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'andi@gmail.com',
                            style: FontTheme.regular.copyWith(
                                color: ColorTheme.darkGray, fontSize: 12.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ...List.generate(
                    4,
                    (index) => NavigationWidget(
                        currentRoute: _.currentRoute,
                        data: index < 3 ? PageModel.pageData[index] : null))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
