import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/address/address_model.dart';

class AddressController extends GetxController {
  final controller = Get.put(UserController());
  List<dynamic> addressList = [];
  void addAddressList(AddressModel address) {
    try {
      // if (isItemAlreadyExist(product)) {
      //   print('object');
      // } else {

      controller.updateUserData({
        "user_address": FieldValue.arrayUnion(
          [
            {
              "name": address.name,
              "phone_number": address.phoneNumber,
              "pincode": address.pinCode,
              "state": address.state,
              "city": address.city,
              "house_number": address.houseNumber,
              "road_name": address.roadName
            }
          ],
        ),
      });
    } catch (e) {
      print(e);
    }
    getuserAddressList();
  }

  void getuserAddressList() async {
    await FirebaseFirestore.instance
        .collection('user_datas')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      addressList = value['user_address'];

      log("${addressList.toString()}......addresss..........................................................");
    });
    update(['addressList']);
  }

  void addressDelete(data) {
    controller.updateUserData({
      "user_address": FieldValue.arrayRemove([data])
    });
    getuserAddressList();

    update(['addressList']);
  }
}
