import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoe_cart/constants/constants.dart';

import '../../controller/user_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final controller = Get.put(UserController());
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = controller.loggedInuser?.fullName ?? '';
    userNameController.text = controller.loggedInuser?.userName ?? '';
    phoneNumberController.text = controller.loggedInuser?.phoneNumber ?? '';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          height20,
          GetBuilder<UserController>(builder: (userImage) {
            return CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 223, 220, 220),
              backgroundImage: NetworkImage(
                  userImage.loggedInuser?.imageUrl ?? userImage.userImageUrl),
              radius: 60,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    onPressed: () {
                      userImage.userImagePicker();
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height20,
          TextFormField(
            controller: phoneNumberController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height20,
          TextFormField(
            controller: userNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height20,
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.key),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(
            height: 150,
          ),
          InkWell(
            onTap: (() {
              final docUser = FirebaseFirestore.instance
                  .collection('user_datas')
                  .doc(FirebaseAuth.instance.currentUser?.uid);
              docUser.update({
                'user_name': nameController.text,
                'user_phone_number': phoneNumberController.text,
                'user_username': userNameController.text,
                'user_image': controller.userImageUrl.isEmpty
                    ? controller.loggedInuser?.imageUrl
                    : controller.userImageUrl
              });
              // Get.snackbar('', 'Updated Successful');
              Get.back();
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
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
