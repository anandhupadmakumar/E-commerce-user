import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/user_controller.dart';

import 'package:shoe_cart/view/home/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 0;
  UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    // controller.getuser();

    log(index.toString());
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        color: const Color.fromARGB(157, 15, 15, 15),
        buttonBackgroundColor: const Color.fromARGB(255, 8, 8, 8),
        backgroundColor: Colors.transparent,
        height: 50,
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
