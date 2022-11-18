import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/Address/address_screen.dart';
import 'package:shoe_cart/view/checkout/checkout_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Shipping Address'),
      body: Stack(
        children: [
          Positioned(
            bottom: 230,
            left: 20,
            top: 0,
            right: 0,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Icon(Icons.location_on),
                      ),
                    ),
                    title: const Text('Home'),
                    subtitle: const Text('61480 sunbrook park,Pc 5679'),
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
                itemCount: 10),
          ),
          Positioned(
            bottom: 150,
            left: 45,
            child: InkWell(
              onTap: () {
                //Add new address
                Get.off(() => const AddressScreen());
              },
              child: Container(
                width: 300,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 178, 175, 175),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Add ew Address',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 45,
            child: InkWell(
              onTap: () {
                //apply the list address
                Get.off(() => CheckoutScreen());
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
