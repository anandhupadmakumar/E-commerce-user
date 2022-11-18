import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Enter Your PIN'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: const Text(
              'Enter your PIN to confirm payment',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Pinput(
            onCompleted: (value) {
              log(value);
            
            },
          ),
         const SizedBox(
            height: 200,
          ),
          InkWell(
            onTap: (() {
              Get.defaultDialog(
                  content: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: LottieBuilder.asset(
                      'asset/images/54141-google-pay-success.json',
                      repeat: false,
                    ),
                  ),
                  const Text('Your Payment is sucessful'),
                  height20,
                  InkWell(
                    onTap: (() {}),
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'View Order',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  height20,
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 172, 171, 171),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
            }),
            child: Container(
              width: 80,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  'Confirm Payment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
