import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  //TODO: Implement UserController

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
