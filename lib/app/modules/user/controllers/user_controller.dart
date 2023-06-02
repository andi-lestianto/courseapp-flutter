import 'package:courseapp/app/helper/mainnavigation_helper.dart';
import 'package:courseapp/app/helper/randomimgurl_helper.dart';
import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/model/user_model.dart';
import 'package:courseapp/app/services/dioclient.dart';
import 'package:courseapp/app/widget/toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final DioClient dioClient = DioClient();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  fillTextField(UserModel data) {
    nameController.text = data.name.toString();
    emailController.text = data.email.toString();
  }

  clearTextField() {
    nameController.clear();
    emailController.clear();
    passController.clear();
    confirmPassController.clear();
  }

  ApiResponse<List<UserModel>> listUser = ApiResponse.initial();

  Future<void> getAllUser() async {
    listUser = ApiResponse.loading();
    update();
    final ApiResponse apiResponse = await dioClient.get('user');

    if (apiResponse.reqStatus == ReqStatus.done) {
      listUser = ApiResponse.done((apiResponse.data as List)
          .map((e) => UserModel.fromJson(e))
          .toList());
    } else if (apiResponse.reqStatus == ReqStatus.error) {
      listUser = ApiResponse.initial();
      Toast()
          .showAlert(title: 'Error', message: apiResponse.message.toString());
    }
    update();
  }

  Future<void> insertUser() async {
    if (nameController.text == '' ||
        emailController.text == '' ||
        passController.text == '' ||
        confirmPassController.text == '') {
      Toast().showAlert(title: 'Gagal', message: 'Semua Data Harus di Isi!');
    } else if (passController.text != confirmPassController.text) {
      Toast().showAlert(
          title: 'Gagal', message: 'Konfirmasi password tidak sama!');
    } else {
      final ApiResponse apiResponse = await dioClient.post('user', {
        'name': nameController.text,
        'email': emailController.text,
        'password': passController.text,
        'pict': RandomImage().getImageUrl()
      });
      if (apiResponse.reqStatus == ReqStatus.done) {
        Toast().showSuccess(
            title: 'Berhasil', message: apiResponse.data['message']);
        getAllUser();
        MainNavigation.homeNav.currentState!.maybePop();
      } else {
        Toast()
            .showAlert(title: 'Gagal', message: apiResponse.message.toString());
      }
    }
  }

  Future<void> updateUser(String idUser) async {
    if (nameController.text == '' ||
        emailController.text == '' ||
        passController.text == '' ||
        confirmPassController.text == '') {
      Toast().showAlert(title: 'Gagal', message: 'Semua Data Harus di Isi!');
    } else if (passController.text != confirmPassController.text) {
      Toast().showAlert(
          title: 'Gagal', message: 'Konfirmasi password tidak sama!');
    } else {
      final ApiResponse apiResponse = await dioClient.put('user', {
        'name': nameController.text,
        'email': emailController.text,
        'password': passController.text,
      }, {
        'iduser': idUser
      });
      if (apiResponse.reqStatus == ReqStatus.done) {
        Toast().showSuccess(
            title: 'Berhasil', message: apiResponse.data['message']);
        getAllUser();
        MainNavigation.homeNav.currentState!.maybePop();
      } else {
        Toast()
            .showAlert(title: 'Gagal', message: apiResponse.message.toString());
      }
    }
  }

  Future<void> deleteUser(String idUser) async {
    final ApiResponse apiResponse =
        await dioClient.delete('user', {'iduser': idUser});
    if (apiResponse.reqStatus == ReqStatus.done) {
      Toast()
          .showSuccess(title: 'Berhasil', message: apiResponse.data['message']);
      MainNavigation.homeNav.currentState!.maybePop();
    } else {
      Toast()
          .showAlert(title: 'Gagal', message: apiResponse.message.toString());
    }
    getAllUser();
  }

  List<UserModel> filteredUser = [];

  searchUser() {
    if (listUser.data != null) {
      filteredUser = listUser.data!
          .where((element) => element.name!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    getAllUser();
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
