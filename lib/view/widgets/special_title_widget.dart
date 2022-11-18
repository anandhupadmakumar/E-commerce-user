import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/view/home/special_offer/special_offer_screen.dart';

class SpecialTitleWidget extends StatelessWidget {
  const SpecialTitleWidget({
    required this.screen,
    required this.title,
    Key? key,
  }) : super(key: key);
  final StatelessWidget screen;
  final title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => screen);
            },
            child: const Text(
              'See All',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
