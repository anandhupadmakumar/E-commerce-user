import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/cart_controller.dart';
import 'package:shoe_cart/controller/promo_code_controller.dart';
import 'package:shoe_cart/model/promocode/promocode_model.dart';
import 'package:shoe_cart/view/checkout/checkout_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';
import '../../constants/constants.dart';

class PromoCodeScreen extends StatelessWidget {
  PromoCodeScreen({super.key});
  int percentNumber = 0;
  final controller = Get.put(PromoCodeController());
  final checkOutController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Promo Code'),
      body: Stack(
        children: [
          Positioned(
            bottom: 100,
            left: 20,
            top: 0,
            right: 0,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("admin_promocode")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final data = PromoCodeModel.fromJson(
                              snapshot.data!.docs[index].data());
                          log(snapshot.data!.docs.toString());
                          percentNumber = data.promoCodePercentage;

                          return ListTile(
                            leading: const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Icon(Icons.location_on),
                              ),
                            ),
                            title: Text(
                                'Special ${data.promoCodePercentage}% off'),
                            subtitle: Text(data.promoCodeDescription),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.radio_button_checked_outlined,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return height20;
                        },
                        itemCount: snapshot.data!.size);
                  } else {
                    return const Center(
                      child: Text('No promocode found'),
                    );
                  }
                }),
          ),
          Positioned(
            bottom: 20,
            left: 45,
            child: InkWell(
              onTap: () {
                print(percentNumber);
              
                // controller.percentage.value = percentNumber;
                Get.off(() => CheckoutScreen(offerValue: percentNumber,));
                //apply the list address
              },
              child: Container(
                width: 300,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
