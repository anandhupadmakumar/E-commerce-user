import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/whishlist/whislist_model.dart';

class WishListController extends GetxController {
  @override
  void onReady() {
    getuserWishListItem();
    super.onReady();
  }

  final UserController controller = Get.put(UserController());
  List wishListItems = [];
  WishListModel? wishData;
  List wishlistProductName = [];
  void addProdutUserWishList(WishListModel product) {
    try {
      // if (isItemAlreadyExist(product)) {
      //   print('object');
      // } else {
      String itemid = DateTime.now().microsecondsSinceEpoch.toString();
      controller.updateUserData({
        "userWishList": FieldValue.arrayUnion([
          {
            "id": product.id,
            "product_name": product.productName,
            "product_price": product.productPrice,
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
    getuserWishListItem();

    // bool b = a.contains(data.productName);
    // print(b);
    update(['wishlistScreen']);
  }

  void getuserWishListItem() async {
    await FirebaseFirestore.instance
        .collection('user_datas')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      wishListItems = value['userWishList'];

      log("${wishListItems.toString()}......wish..........................................................");
    });
    wishlistProductName = wishListItems.map((e) => e['product_name']).toList();
    update(['wishlistScreen', 'wishList']);
  }

  void wishListDelete(data) {
    controller.updateUserData({
      "userWishList": FieldValue.arrayRemove([data])
    });
    getuserWishListItem();
    update(['wishlistScreen']);
  }
}
