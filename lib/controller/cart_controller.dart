import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/my_cart_model/my_cart_model.dart';
import 'package:shoe_cart/model/product_model/product_model.dart';
import 'package:shoe_cart/model/user_profile/user_profile_model.dart';
import 'package:shoe_cart/view/home/bottom_navigation/bottom_screen.dart';
import 'package:shoe_cart/view/home/home_screen.dart';

class CartController extends GetxController {
  UserController userController = Get.put(UserController());
  RxDouble totalprice = 0.0.obs;
  RxString total = '0'.obs;
  List userCart = [];
  final Razorpay razorpay = Razorpay();
  @override
  void onInit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ever(userController.userModel, changeTotalPrice);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.offAll(() => const BottomNavigationScreen());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  void addProdutUserCart(MyCartModel product) {
    try {
      // if (isItemAlreadyExist(product)) {
      //   print('object');
      // } else {
      String itemid = DateTime.now().microsecondsSinceEpoch.toString();
      userController.updateUserData({
        "userCart": FieldValue.arrayUnion([
          {
            "id": product.id,
            "product_name": product.productName,
            "product_price": product.productPrice,
            "item_count": product.itemCount,
            "product_size": product.size,
            "product_color": product.color,
            "product_image": product.productImage,
          }
        ])
      });
      //}
    } catch (e) {
      print(e);
    }
  }

  void removeCartItem(MyCartModel cartItem) {
    try {
      userController.updateUserData({
        "userCart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void changeTotalPrice(UserSignUpModel usermodel) {
    totalprice.value = 0.0;
    if (usermodel.cart!.isNotEmpty) {
      usermodel.cart!.map((cartItem) {
        totalprice.value += cartItem.productPrice;
      });
    }
  }

  // bool isItemAlreadyExist(MyCartModel product) {}

  void decreaseQuantity(MyCartModel item) {
    if (item.itemCount == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      userController.itemCount--;
      userController.updateUserData({
        "userCart": FieldValue.arrayUnion([item.toJson()]),
      });
    }
  }

  void increaseQuantity(MyCartModel item) {
    removeCartItem(item);
    userController.itemCount++;
    userController.updateUserData({
      "userCart": FieldValue.arrayUnion([item.toJson()]),
    });
  }

  void getuserCartItem() async {
    await FirebaseFirestore.instance
        .collection('user_datas')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userCart = value['userCart'];

      log("${userCart.toString()}................................................................");
    });
    update(['totalprice', 'itemAdded', 'delete']);
  }

  toatalPrice() {
    totalprice.value = 0.0;
    // final a = userCart!.map((e) => e['product_price']);
    // final tota = a.map((e) => totalprice.value += e);
    // total = '${tota.last}';
    for (var i = 0; i < userCart.length; i++) {
      totalprice.value += userCart[i]['product_price'];
    }

    log('${totalprice.value} list total price print ..................>>>>>>>>>>>>>>>>');

    update(['totalprice']);
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }
}
