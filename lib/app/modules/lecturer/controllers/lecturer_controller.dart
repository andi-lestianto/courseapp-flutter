import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LecturerController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nidnController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  String selectedJenkel = 'Laki - Laki';

  updateJenkel(String value) {
    selectedJenkel = value;
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
