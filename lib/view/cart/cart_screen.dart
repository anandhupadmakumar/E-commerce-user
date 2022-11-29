import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/cart_controller.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/my_cart_model/my_cart_model.dart';

import 'package:shoe_cart/model/user_profile/user_profile_model.dart';
import 'package:shoe_cart/view/checkout/checkout_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.put(UserController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // cartController.toatalPrice();
    // cartController.totalprice.value = 0;
    cartController.getuserCartItem();
    // controller.getuser();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(title: 'My Cart'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            bottom: 100,
            child: GetBuilder<CartController>(
                id: 'itemAdded',
                builder: (userCdata) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // final data = UserSignUpModel.fromJson(
                      //     cartController.userCart![index]);
                      // print(snapshot.data?.docs[index].data());
                      // log(data.cart.toString());

                      // final items = data;
                      // log(items.toString());
                      final data =
                          MyCartModel.fromJson(cartController.userCart[index]);

                      // final tatoal = cartController.userCart!.map((e) {
                      //   e['product_price'];
                      //   cartController.toatalPrice(e['product_price']);
                      //   log('${e['product_price']} marrrrr.....................');
                      //   cartController.totalprice.value += e['product_price'];
                      // });

                      // log('${cartController.totalprice} marrrrr.....................');

                      return GetBuilder<CartController>(
                          id: 'delete',
                          builder: (cData) {
                            return ListTile(
                              // isThreeLine: true,
                              leading: Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Image(
                                  image: NetworkImage(data.productImage),
                                ),
                              ),
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Text(data.productName),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: (() {
                                            Get.bottomSheet(
                                              BottomSheet(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  onClosing: () {},
                                                  builder: (context) {
                                                    return SizedBox(
                                                      height: 300,
                                                      child: ListView(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 20),
                                                        children: [
                                                          const Center(
                                                            child: Text(
                                                              'Remove From Cart?',
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          height20,
                                                          ListTile(
                                                            // isThreeLine: true,
                                                            leading: Container(
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10))),
                                                              width: 70,
                                                              height: 70,
                                                              child: Image(
                                                                  image: NetworkImage(
                                                                      data.productImage)),
                                                            ),
                                                            title: Row(
                                                              children: [
                                                                Text(data
                                                                    .productName),
                                                                const Spacer(),
                                                              ],
                                                            ),
                                                            subtitle: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    '${data.color} | ${data.size}'),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        '${data.productPrice}'),
                                                                    const Spacer(),
                                                                    //  const  CircleAvatar(
                                                                    //     radius: 10,
                                                                    //     backgroundColor:
                                                                    //         Colors
                                                                    //             .black,
                                                                    //     child:
                                                                    //         Text('-'),
                                                                    //   ),
                                                                    //  const  SizedBox(
                                                                    //     width: 10,
                                                                    //   ),
                                                                    //   CircleAvatar(
                                                                    //     radius: 10,
                                                                    //     backgroundColor:
                                                                    //         Colors
                                                                    //             .black,
                                                                    //     child: Text(
                                                                    //         '01'),
                                                                    //   ),
                                                                    // SizedBox(
                                                                    //   width: 10,
                                                                    // ),
                                                                    // CircleAvatar(
                                                                    //   radius: 10,
                                                                    //   backgroundColor:
                                                                    //       Colors
                                                                    //           .black,
                                                                    //   child:
                                                                    //       Text('+'),
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 80,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20),
                                                                  width: 180,
                                                                  height: 50,
                                                                  decoration: const BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          74,
                                                                          73,
                                                                          73),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(40))),
                                                                  child: Center(
                                                                      child:
                                                                          Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: const [
                                                                      Text(
                                                                        'Cancel',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 18),
                                                                      ),
                                                                    ],
                                                                  )),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  // cartController
                                                                  //     .removeCartItem(
                                                                  //         data);
                                                                  // log('${cartController.userCart![index]}.>>>>>......................................');
                                                                  // cartController
                                                                  //     .userCart![index];

                                                                  controller
                                                                      .updateUserData({
                                                                    "userCart":
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      cartController
                                                                              .userCart[
                                                                          index]
                                                                    ])
                                                                  });

                                                                  // .removeCartItem(
                                                                  //     cartController
                                                                  //             .userCart![
                                                                  //         index]);

                                                                  //cartitem delete
                                                                  // userCdata
                                                                  //     .getuser();
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20),
                                                                  width: 180,
                                                                  height: 50,
                                                                  decoration: const BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(40))),
                                                                  child: Center(
                                                                      child:
                                                                          Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: const [
                                                                      Text(
                                                                        'Yes ,Remove',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 18),
                                                                      ),
                                                                    ],
                                                                  )),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            );
                                          }),
                                          icon: const Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${data.color}| ${data.size}'),
                                  height10,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ₹${data.productPrice}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const Spacer(),
                                      const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.black,
                                        child: Text('-'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.black,
                                        child: Text(data.itemCount),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GetBuilder<CartController>(
                                          builder: (controllerdata) {
                                        return InkWell(
                                          onTap: (() {
                                            // cData.increaseQuantity(data);
                                            // int a = int.parse(data.itemCount);
                                            // a++;
                                            // data.productPrice *= a;
                                            // log(data.productPrice.toString());
                                          }),
                                          child: const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.black,
                                            child: Center(child: Text('+')),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    separatorBuilder: (context, index) {
                      return height20;
                    },
                    itemCount: cartController.userCart.length,
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total Amount',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<CartController>(
                          id: 'totalprice',
                          builder: (datas) {
                            datas.toatalPrice();
                            return Text(
                              ' ₹${datas.totalprice}',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            );
                          }),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => CheckoutScreen());
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Checkout',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
