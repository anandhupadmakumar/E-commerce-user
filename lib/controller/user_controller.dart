import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoe_cart/controller/cart_controller.dart';

import '../model/user_profile/user_profile_model.dart';

// import 'package:image_picker/image_picker.dart';
CartController _cartController = Get.put(CartController());

class UserController extends GetxController {
  UserSignUpModel? loggedInuser;
  Rx<UserSignUpModel> userModel = UserSignUpModel().obs;

  int itemCount = 1;
  double totalAmount = 0;
  String pinInputValue = "";
  XFile? userImage;
  String userImageUrl = '';
  final _picker = ImagePicker();
  String userPhoneNumber = "";
  bool? obsecure;
  @override
  void onReady() {
    _cartController.getuserCartItem();
    // TODO: implement onReady
    super.onReady();
  }

  void visibility(String id) {
    if (obsecure == null || obsecure == true) {
      obsecure = false;
    } else {
      obsecure = true;
    }
    update([id]);
  }

  void productCountIncrement() {
    itemCount++;
    update();
  }

  void productCountDecrement() {
    if (itemCount <= 1) {
      itemCount = 1;
    } else {
      itemCount--;
    }
    update();
  }

  userImagePicker() async {
    final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
    userImage = await _picker.pickImage(source: ImageSource.gallery);
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('user_profile_images/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uniqueProductImageName.toString());
    log(uniqueProductImageName.toString());
    if (userImage == null) {
      return;
    }
    try {
      await referenceImageToUpload.putFile(File(userImage!.path));

      userImageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      log(e.toString());
    }

    update();
  }

  void getuser() async {
    await FirebaseFirestore.instance
        .collection('user_datas')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      loggedInuser = UserSignUpModel.fromJson(value.data()!);

      // log(value['userCart'].toString());
    });
    update();
  }

  updateUserData(Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection("user_datas")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(data);
    _cartController.getuserCartItem();

    update();
  }
}
