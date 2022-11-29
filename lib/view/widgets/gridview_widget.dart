import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/wishlist_controller.dart';
import 'package:shoe_cart/model/product_model/product_model.dart';
import 'package:shoe_cart/model/whishlist/whislist_model.dart';
import 'package:shoe_cart/view/product_details/product_details_screen.dart';

class GridviewWidget extends StatelessWidget {
  GridviewWidget({
    Key? key,
  }) : super(key: key);
  final WishListController wishController = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    wishController.onReady();
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("admin").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.size,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  final data =
                      ProductModel.fromJson(snapshot.data!.docs[index].data());

                  log(data.productImage);
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => ProductDetailsScreen(
                              productTitle: data.productName,
                              productPrice: data.productPrice.toString(),
                              productImage: data.productImage,
                              productOffer: data.productDescription,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Image(
                              image:
                                  NetworkImage(data.productImage, scale: 1.9),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              if (wishController.wishlistProductName
                                  .contains(data.productName)) {
                                wishController.wishListDelete(
                                    wishController.wishListItems[index]);
                              } else {
                                final addWishList = WishListModel(
                                    id: data.id,
                                    productName: data.productName,
                                    productPrice: data.productPrice,
                                    size: '40',
                                    productImage: data.productImage,
                                    color: 'green');
                                wishController
                                    .addProdutUserWishList(addWishList);
                              }
                              // final a = wishController.wishListItems
                              //     .map((e) => e['product_name'])
                              //     .toList();
                              // bool b = wishController.wishlistProductName
                              //     .contains(data.productName);
                              // print(data.productName);
                            },
                            child: GetBuilder<WishListController>(
                                id: 'wishList',
                                builder: (wData) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: wData.wishlistProductName
                                            .contains(data.productName)
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite_border_outlined,
                                          ),
                                  );
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              data.productName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹ ${data.productPrice}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            const Text("Extra 15% off applied  at checkout"),
                          ],
                        ),
                      )
                    ],
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
