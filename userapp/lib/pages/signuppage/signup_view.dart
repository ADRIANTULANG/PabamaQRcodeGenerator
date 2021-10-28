import 'package:flutter/material.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/signuppage/signup_controller.dart';
import 'package:get/get.dart';
// import 'package:userapp/pages/signuppage/signup_otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:userapp/pages/signuppage/signup_otp_view.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var sizer = Sizer();
    // var fontsize =
    Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  height: sizer.height(context: context, height: 40),
                  width: sizer.width(context: context, width: 100),
                  child: Center(
                      child: Image.asset('assets/images/splashscreen.jpeg')),
                ),
                Container(
                  height: h * 0.60,
                  width: w * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.06,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Create New Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                sizer.font(context: context, fontsize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      Container(
                        height: h * 0.08,
                        width: w * 0.80,
                        alignment: Alignment.center,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Theme.of(context).indicatorColor,
                          controller: controller.username,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () => _node.nextFocus(),
                          decoration: InputDecoration(
                            // prefixText: '+63',
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 10.0,
                              top: 5.0,
                              right: 5.0,
                              bottom: 5.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.08,
                        width: w * 0.80,
                        alignment: Alignment.center,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Theme.of(context).indicatorColor,
                          controller: controller.password,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () => _node.nextFocus(),
                          decoration: InputDecoration(
                            // prefixText: '+63',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 10.0,
                              top: 5.0,
                              right: 5.0,
                              bottom: 5.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.08,
                        width: w * 0.80,
                        alignment: Alignment.center,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Theme.of(context).indicatorColor,
                          controller: controller.fullname,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () => _node.nextFocus(),
                          decoration: InputDecoration(
                            // prefixText: '+63',
                            labelText: 'full name',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 10.0,
                              top: 5.0,
                              right: 5.0,
                              bottom: 5.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.08,
                        width: w * 0.80,
                        alignment: Alignment.center,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Theme.of(context).indicatorColor,
                          controller: controller.contanctnumber,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () => _node.nextFocus(),
                          decoration: InputDecoration(
                            prefixText: '+63',
                            labelText: 'Contact number',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 10.0,
                              top: 5.0,
                              right: 5.0,
                              bottom: 5.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Container(
                        height: h * 0.05,
                        width: w * 0.80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black87,
                            primary: Colors.black,
                            // minimumSize: Size(h * 0.20, w * 0.10),
                            // padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          onPressed: () async {
                            controller.isLoadingOtp.value = true;
                            if (controller.username.text.isEmpty ||
                                controller.password.text.isEmpty ||
                                controller.fullname.text.isEmpty ||
                                controller.contanctnumber.text.isEmpty) {
                            } else {
                              print(controller.contanctnumber.text);
                              await _auth.verifyPhoneNumber(
                                phoneNumber:
                                    "+63${controller.contanctnumber.text}",
                                verificationCompleted:
                                    (phoneAuthCredential) async {},
                                verificationFailed:
                                    (verificationFailed) async {},
                                codeSent: (
                                  verificationId,
                                  resendingToken,
                                ) async {
                                  controller.verificationId = verificationId;
                                  Get.to(() => SingUpOTP());
                                },
                                codeAutoRetrievalTimeout:
                                    (verificationId) async {},
                              );
                            }
                          },
                          child: controller.isLoadingOtp.value == true
                              ? CircularProgressIndicator()
                              : Text(
                                  'Verify',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
