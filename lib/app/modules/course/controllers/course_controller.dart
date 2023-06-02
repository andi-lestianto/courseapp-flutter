import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  //TODO: Implement CourseController
  final TextEditingController searchController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sksController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  List<String> lecturerData = ['22323. Banana', '123123. Budi Kecil'];
  String selectedLecturer = '22323. Banana';

  updateLecturer(String value) {
    selectedLecturer = value;
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
