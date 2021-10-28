import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/helpers/storage_service.dart';
import 'package:userapp/pages/homepage/home_view.dart';
import 'package:userapp/pages/loginpage/login_api.dart';
import 'package:userapp/pages/loginpage/login_model.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();

  RxList<User> userInfo = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      var result = await LoginApi.loginApi(
        username: username.text,
        password: password.text,
      );
      userInfo.assignAll(result);
      if (userInfo.length != 0) {
        Get.find<StorageService>().storeUserCredentials(
            userid: userInfo[0].userid,
            fullname: userInfo[0].fullname,
            password: userInfo[0].password,
            username: userInfo[0].username,
            contactnumber: userInfo[0].contactnumber);
        Get.offAll(() => HomeView());
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }
}
