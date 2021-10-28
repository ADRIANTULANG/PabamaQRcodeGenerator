import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/loginpage/login_view.dart';
import 'package:userapp/pages/signuppage/signup_api.dart';

// import 'package:firebase_core/firebase_core.dart';

class SignUpController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController contanctnumber = TextEditingController();

  int _minOtpValue = 0;
  int _maxOtpValue = 0;
  int _otp = 0;

  RxBool isLoadingOtp = false.obs;

  String verificationId = "";

  @override
  void onInit() {
    super.onInit();
  }

  generateOtp([int min = 1000, int max = 9999]) {
    //Generates four digit OTP by default
    _minOtpValue = min;
    _maxOtpValue = max;
    _otp = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
    return _otp;
  }

  Future<void> addUser(context) async {
    try {
      var result = await SignUpApi.addUserApi(
          fullname: fullname.text,
          username: username.text,
          password: password.text,
          contactnumber: contanctnumber.text);
      if (result == true) {
        isLoadingOtp.value = false;
        print("Success adding user");
        confirmSuccesfulAccountRegistration(context);
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  confirmSuccesfulAccountRegistration(context) {
    var sizer = Sizer();
    Get.dialog(
      AlertDialog(
        content: Container(
          height: sizer.height(context: context, height: 15),
          width: sizer.width(context: context, width: 70),
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "MESSAGE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: sizer.height(context: context, height: 2),
                ),
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "CONGRATULATIONS, YOUR ACCOUNT HAS BEEN SUCCESSFULLY CREATED.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TextButton(
                //   child: Text(
                //     'BACK',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onPressed: () {
                //     Get.back();
                //   },
                // ),
                TextButton(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  onPressed: () async {
                    Get.offAll(() => LoginView());
                  },
                ),
              ],
            ),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
