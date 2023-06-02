import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LecturerController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  //TODO: Implement LecturerController

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
