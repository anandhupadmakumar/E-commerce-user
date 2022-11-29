import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/controller/wishlist_controller.dart';
import 'package:shoe_cart/model/whishlist/whislist_model.dart';
import '../widgets/appbar_widget.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  final WishListController wishController = Get.put(WishListController());
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    wishController.onReady();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBarWidget(
          title: 'Wish List',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height20,
            // SizedBox(
            //   height: 40,
            //   child: ListView(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     children: const [
            //       BrandWidget(content: 'All'),
            //       width20,
            //       BrandWidget(content: 'Nike'),
            //       width20,
            //       BrandWidget(content: 'Puma'),
            //       width20,
            //       BrandWidget(content: 'Adidas'),
            //       width20,
            //       BrandWidget(content: 'Rebook'),
            //     ],
            //   ),
            // ),
            wishController.wishListItems.isNotEmpty
                ? GetBuilder<WishListController>(
                    id: 'wishlistScreen',
                    builder: (WishListController wishData) {
                      return GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: wishData.wishListItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                          ),
                          itemBuilder: (context, index) {
                            // final data =
                            //     ProductModel.fromJson(snapshot.data!.docs[index].data());

                            // log(data.productImage);
                            wishController.wishData = WishListModel.fromJson(
                                wishData.wishListItems[index]);
                            log(wishController.wishData!.productName);
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Get.to(
                                    //   () => ProductDetailsScreen(
                                    //     productTitle: data.productName,
                                    //     productPrice: data.productPrice.toString(),
                                    //     productImage: data.productImage,
                                    //     productOffer: data.productDescription,
                                    //   ),
                                    // );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: NetworkImage(
                                            wishData.wishListItems[index]
                                                ['product_image'],
                                            scale: 1.9),
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
                                        // controller.updateUserData({
                                        //   "userWishList":
                                        //       FieldValue.arrayRemove([
                                        //     wishController.wishListItems[index]
                                        //   ])
                                        // });
                                        wishData.wishListDelete(
                                            wishData.wishListItems[index]);
                                        // final addWishList = WishListModel(
                                        //     id: data.id,
                                        //     productName: data.productName,
                                        //     productPrice: data.productPrice,
                                        //     size: '40',
                                        //     productImage: data.productImage,
                                        //     color: 'green');
                                        // wishController.addProdutUserWishList(addWishList);
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        wishData.wishListItems[index]
                                            ['product_name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '₹ ${wishData.wishListItems[index]['product_price']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      const Text(
                                          "Extra 15% off applied  at checkout"),
                                    ],
                                  ),
                                )
                              ],
                            );
                          });
                    })
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 200),
                      child: Text(
                        'no data found',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
