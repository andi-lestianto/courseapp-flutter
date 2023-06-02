import 'package:courseapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  redirectPage() async {
    await Future.delayed(Duration(seconds: 3))
        .then((value) => Get.offAllNamed(Routes.LOGIN));
  }

  final count = 0.obs;
  @override
  void onInit() {
    redirectPage();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
