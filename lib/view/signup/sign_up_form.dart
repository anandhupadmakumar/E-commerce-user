import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/user_profile/user_profile_model.dart';
import 'package:shoe_cart/view/home/bottom_navigation/bottom_screen.dart';
import 'package:shoe_cart/view/home/home_screen.dart';
import 'package:shoe_cart/view/user_login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final UserController userProfileController = Get.put(UserController());

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SignUp ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            height20,
            GetBuilder<UserController>(builder: (userImage) {
              return CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 223, 220, 220),
                backgroundImage: NetworkImage(userImage.userImageUrl),
                radius: 60,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                      onPressed: () {
                        userProfileController.userImagePicker();
                        //image picker function
                      },
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.black,
                      )),
                ),
              );
            }),
            height20,
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "enter the name";
                }
                bool nameValid = RegExp("^[a-zA-Z]").hasMatch(value);
                if (!nameValid) {
                  return "Invalid FullName ";
                } else if (value.length < 6) {
                  return "enter atleast 6 characters";
                }
              },
              decoration: const InputDecoration(
                label: Text(' Name(Required)*'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            height10,
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                label: Text(' UserName(Required)*'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return " User Name is required";
                } else if (value.length < 6) {
                  return "too short";
                }
              },
            ),
            height10,
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              decoration: const InputDecoration(
                label: Text('PhoneNumber (Required*)'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: ((value) {
                if (value!.isEmpty) {
                  return 'Phone number is required';
                } else if (!value.contains('+91')) {
                  return "country code is required";
                }
              }),
            ),
            height10,
            GetBuilder<UserController>(
                id: 'password',
                builder: (data) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: data.obsecure ?? false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            data.visibility('password');
                          },
                          icon: data.obsecure == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined)),
                      label: const Text(' Password(Required)*'),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password is required';
                      }

                      if (value.length < 8) {
                        return "password must be 8 characters ";
                      }
                    },
                  );
                }),
            height20,
            GetBuilder<UserController>(
                id: 'confirmPassword',
                builder: (pswordIcon) {
                  return TextFormField(
                    obscureText: pswordIcon.obsecure ?? true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            pswordIcon.visibility('confirmPassword');
                          },
                          icon: pswordIcon.obsecure == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined)),
                      label: const Text('ConfirmPassword(Required)*'),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'confirm password is required';
                      }

                      if (value != passwordController.text) {
                        return "confirm password is incorrect ";
                      }
                    },
                  );
                }),
            height20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                onTap: () async {
                  //send user data to the firebase
                  if (formkey.currentState!.validate()) {
                    signUpfn();
                    signInUser(userNameController.text.trim(),
                        passwordController.text.trim());

                    print('success');
                    final signUp = UserSignUpModel(
                      userId: FirebaseAuth.instance.currentUser?.uid,
                      fullName: nameController.text,
                      phoneNumber: phoneNumberController.text,
                      userName: userNameController.text,
                      password: passwordController.text,
                      isBlocked: 'false',
                      imageUrl: userProfileController.userImageUrl,
                      cart: []
                    );

                    final continueSignup = FirebaseFirestore.instance
                        .collection('user_datas')
                        .doc(FirebaseAuth.instance.currentUser?.uid);

                    final json = signUp.toJson();
                    await continueSignup.set(json);
                  }
                },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUpfn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      print(e);
    }
  }
}

Future<void> signInUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Get.to(() => BottomNavigationScreen());
  } catch (e) {
    print(e);
  }
}
