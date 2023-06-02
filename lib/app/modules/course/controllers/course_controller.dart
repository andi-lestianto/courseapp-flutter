import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  //TODO: Implement CourseController
  final TextEditingController searchController = TextEditingController();

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
