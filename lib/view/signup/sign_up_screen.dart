import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

import '../user_login/forgot_password/otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  UserController profileCntrl = Get.put(UserController());
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'SignUp'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          height20,
          const SizedBox(
            child: Image(
                image:
                    AssetImage('asset/images/undraw_Mobile_login_re_9ntv.png')),
          ),
          // CircleAvatar(
          //   radius: 60,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child:
          //         IconButton(onPressed: () {}, icon: const Icon(Icons.camera)),
          //),
          //),
          // height20,
          // TextFormField(
          //   decoration: const InputDecoration(
          //     label: Text('User Name(Required)*'),
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(color: Colors.black, width: 2),
          //       borderRadius: BorderRadius.all(Radius.circular(10)),
          //     ),
          //   ),
          // ),
          height20,
          height20,
          TextFormField(
            onChanged: (Value) {
              log(Value);
            },
            keyboardType: TextInputType.phone,
            controller: phoneNumberController,
            decoration: const InputDecoration(
              label: Text('Phone number(Required)*'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: InkWell(
              onTap: (() async {
                if (FirebaseAuth.instance.currentUser!.phoneNumber ==
                    '+91${phoneNumberController.text}') {
                  profileCntrl.userPhoneNumber =
                      '+91${phoneNumberController.text}';
                  print('gdtdgfdfgdgdfgdh');
                } else {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${phoneNumberController.text}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      Get.to(() => OtpScreen(
                            verifyId: verificationId,
                          ));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
              }),
              child: Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text(
                    'Send Code',
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
