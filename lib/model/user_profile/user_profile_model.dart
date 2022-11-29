import 'dart:convert';
import 'dart:developer';

import 'package:shoe_cart/model/my_cart_model/my_cart_model.dart';

class UserSignUpModel {
  UserSignUpModel({
    this.userId,
    this.fullName,
    this.phoneNumber,
    this.userName,
    this.password,
    this.isBlocked,
    this.imageUrl,
    this.cart,
    this.wishList,
     this.address,
  });

  String? userId;
  String? fullName;
  String? phoneNumber;
  String? userName;
  String? password;
  String? isBlocked;
  String? imageUrl;
  List<MyCartModel>? cart;
  List? wishList;
  List? address;

  UserSignUpModel.fromJson(Map<String, dynamic> json) {
    userId = json["id"];
    imageUrl = json["user_image"];
    fullName = json["user_name"];
    phoneNumber = json["user_phone_number"];
    userName = json["user_username"];
    password = json["user_password"];
    isBlocked = json["is_blocked"];
    cart = converMycartModel(json["userCart"]);
    wishList = json["userWishList"] ?? [];
    address = json["user_address"]??[];
    print(
        '$cart,,,,,,,,,,,,..........................................<<<<<>>>>>>>>>');
  }

  Map<String, dynamic> toJson() => {
        "id": userId,
        "user_image": imageUrl,
        "user_name": fullName,
        "user_phone_number": phoneNumber,
        "user_username": userName,
        "user_password": password,
        "is_blocked": isBlocked,
        "userCart": cart,
        "userWishList": wishList,
        "user_addres": address,
      };

  List<MyCartModel> converMycartModel(List cartFromDb) {
    List<MyCartModel> result = [];
    List<MyCartModel> results = [];

    cartFromDb.map((element) {
      result.add(MyCartModel.fromJson(element));
      final data = MyCartModel.fromJson(element);

      log('${element[0]}..........................????????????????????????????//////////////////...............................');
      log('${cartFromDb.toString()} .....................ananaanana................');
      // result.add(data);
    });

    log('${result} .....................ananaanana............>>>>>>>>>>................');

    return result;
  }
}
