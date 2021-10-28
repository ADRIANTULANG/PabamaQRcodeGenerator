import 'dart:async';
import 'package:get/get.dart';
import 'package:userapp/pages/homepage/home_view.dart';
import 'package:userapp/pages/loginpage/login_view.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenControlller extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    navigateAfterView();
  }

  navigateAfterView() {
    Timer(Duration(seconds: 6), () {
      if (box.read('userid') == null) {
        Get.offAll(() => LoginView());
      } else {
        Get.offAll(() => HomeView());
      }
    });
  }
}
