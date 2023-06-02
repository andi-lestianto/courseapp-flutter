import 'package:courseapp/app/model/user_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  UserModel? loggedUser;

  setLoggedUser(UserModel? data) {
    loggedUser = data;
  }
}
