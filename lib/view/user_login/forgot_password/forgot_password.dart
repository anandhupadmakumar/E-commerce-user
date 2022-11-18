import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/user_login/forgot_password/otp_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Forgot Password'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          const SizedBox(
            height: 300,
            width: 300,
            child: Image(
              image:
                  AssetImage('asset/images/undraw_Forgot_password_re_hxwm.png'),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your Phone number ',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: InkWell(
              onTap: (() {
                Get.to(() =>  OtpScreen());
              }),
              child: Container(
                width: 20,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
