import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/signuppage/signup_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpOTP extends GetView<SignUpController> {
  const SingUpOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;

    void signInWithPhoneAuthCredential(
        PhoneAuthCredential phoneAuthCredential, context) async {
      try {
        final authCredential =
            await _auth.signInWithCredential(phoneAuthCredential);

        if (authCredential.user != null) {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          print("OTP SUCCESS");
          controller.addUser(context);
        }
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

    var sizer = Sizer();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  "Please Enter OPT.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizer.font(context: context, fontsize: 20)),
                )),
            SizedBox(
              height: sizer.height(context: context, height: 3),
            ),
            Container(
              alignment: Alignment.center,
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.red,
                disabledBorderColor: Colors.black,
                enabledBorderColor: Colors.red,
                fillColor: Colors.red,
                showFieldAsBox: true,

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: controller.verificationId,
                          smsCode: verificationCode);

                  signInWithPhoneAuthCredential(phoneAuthCredential, context);
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text("Verification Code"),
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     });
                }, // end onSubmit
              ),
            )
          ],
        ),
      ),
    );
  }
}
