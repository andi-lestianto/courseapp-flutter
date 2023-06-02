import 'package:courseapp/app/routes/app_pages.dart';

class PageModel {
  final String label;
  final String iconPath;
  final String routes;

  PageModel(this.label, this.iconPath, this.routes);

  static List<PageModel> pageData = [
    PageModel('Data Dosen', 'assets/icon/ic-lecturer.svg', Routes.LECTURER),
    PageModel('Data Mata Kuliah', 'assets/icon/ic-course.svg', Routes.COURSE),
    PageModel('Data Pengguna', 'assets/icon/ic-user.svg', Routes.USER),
  ];
}
