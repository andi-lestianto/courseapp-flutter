import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime currentBackPressTime = DateTime.now();
  String currentRoute = '/lecturer';

  setCurrentRoute(String route) async {
    if (route == '/') {
      currentRoute = '/lecturer';
    } else {
      currentRoute = route;
    }

    await Future.delayed(Duration.zero).then((value) => update());
  }

  setCurrentBackPressTime(DateTime dateTime) {
    currentBackPressTime = dateTime;
  }
  //TODO: Implement HomeController

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
