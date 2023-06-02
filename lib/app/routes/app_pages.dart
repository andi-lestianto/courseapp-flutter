import 'package:get/get.dart';

import 'package:courseapp/app/modules/course/bindings/course_binding.dart';
import 'package:courseapp/app/modules/course/views/course_view.dart';
import 'package:courseapp/app/modules/home/bindings/home_binding.dart';
import 'package:courseapp/app/modules/home/views/home_view.dart';
import 'package:courseapp/app/modules/lecturer/bindings/lecturer_binding.dart';
import 'package:courseapp/app/modules/lecturer/views/lecturer_view.dart';
import 'package:courseapp/app/modules/login/bindings/login_binding.dart';
import 'package:courseapp/app/modules/login/views/login_view.dart';
import 'package:courseapp/app/modules/user/bindings/user_binding.dart';
import 'package:courseapp/app/modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LECTURER,
      page: () => LecturerView(),
      binding: LecturerBinding(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
  ];
}
