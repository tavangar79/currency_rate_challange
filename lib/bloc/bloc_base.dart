import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/loading.dart';

abstract class BlocBase extends GetxController {
  bool _isLoading = false;

  void showLoading() {
    if (!_isLoading) {
      _isLoading = true;
      Get.dialog(
          WillPopScope(onWillPop: () async => true, child: const Loading()));
    }
  }

  Future<void> hideLoading() async {
    if (_isLoading) {
      _isLoading = false;
      Get.back();
    }
  }

  @override
  void dispose();
}
