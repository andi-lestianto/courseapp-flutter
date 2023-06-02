import 'package:courseapp/app/helper/authcontroller.dart';
import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/model/user_model.dart';
import 'package:courseapp/app/routes/app_pages.dart';
import 'package:courseapp/app/services/dioclient.dart';
import 'package:courseapp/app/widget/toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final DioClient dioClient = DioClient();
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ApiResponse<UserModel> userLogged = ApiResponse.initial();

  Future<void> processLogin() async {
    userLogged = ApiResponse.loading();
    update();
    final ApiResponse apiResponse = await dioClient.post('auth',
        {'email': emailController.text, 'password': passwordController.text});

    if (apiResponse.reqStatus == ReqStatus.done) {
      userLogged =
          ApiResponse.done(UserModel.fromJson(apiResponse.data['data']));
      Toast()
          .showSuccess(title: 'Berhasil', message: apiResponse.data['message']);
      authController.setLoggedUser(userLogged.data);
      Get.offAllNamed(Routes.HOME);
    } else if (apiResponse.reqStatus == ReqStatus.error) {
      userLogged = ApiResponse.initial();
      Toast()
          .showAlert(title: 'Error', message: apiResponse.message.toString());
    }

    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
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
