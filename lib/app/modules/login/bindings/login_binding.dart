import 'package:courseapp/app/helper/authcontroller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
