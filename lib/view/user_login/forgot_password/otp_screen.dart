import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/view/user_login/login_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

import '../../../constants/constants.dart';
import '../../signup/sign_up_form.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    super.key,
    this.verifyId = "",
  });
  final String verifyId;
  final UserController verifyController = Get.put(UserController());
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Enter your OTP'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text(
              'Code has been send to  +91***4093',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Pinput(
            length: PinputConstants.defaultSmsCodeMatcher.length - 1,
            onCompleted: (value) {
              log(value);
              verifyController.pinInputValue = value;
            },
          ),
          height20,
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text('Resend code in 53 s'),
          ),
          const SizedBox(
            height: 170,
          ),
          InkWell(
            onTap: (() {
              Get.bottomSheet(
                Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      height20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      height20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'confirm Password',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      height20,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            child: InkWell(
              onTap: () async{
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verifyId,
                    smsCode: verifyController.pinInputValue,
                  );
                  await auth.signInWithCredential(credential);
                  Get.offAll(() =>  SignUpForm());
                } catch (e) {
                  Get.snackbar('warning', 'invlid OTP Number');
                }
              },
              child: Container(
                width: 80,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all( 
                    Radius.circular(40),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
