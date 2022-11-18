import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/model/user_profile/user_profile_model.dart';
import 'package:shoe_cart/view/home/bottom_navigation/bottom_screen.dart';
import 'package:shoe_cart/view/home/home_screen.dart';

import 'package:shoe_cart/view/user_login/forgot_password/forgot_password.dart';

import '../../constants/constants.dart';
import '../signup/sign_up_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavigationScreen();
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(
                  height: 300,
                  width: 300,
                  child: Image(
                    image: AssetImage('asset/images/default-2.png'),
                  ),
                ),
                height20,
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                height20,
                TextFormField(
                  controller: userEmailController,
                  decoration: const InputDecoration(
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                height20,
                TextFormField(
                  controller: userPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPasswordScreen());
                        },
                        child: const Text('Forgot Password'))
                  ],
                ),
                height20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: InkWell(
                    onTap: () async {
                      signInUser(userEmailController.text.trim(),
                          userPasswordController.text.trim());
                      // Get.offAll(() => const BottomNavigationScreen());
                    },
                    child: Container(
                      width: 80,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignUpForm());
                        },
                        child: const Text('SignUp'))
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
