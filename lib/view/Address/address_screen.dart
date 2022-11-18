import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/location/map_location_screen.dart';
import 'package:shoe_cart/view/shipping_address/shipping_address.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Address'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          height10,
          height10,
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Full Name (Required)*'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height10,
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Phone number (Required)*'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height10,
          Row(
            children: [
              SizedBox(
                width: 170,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Pincode (Required)*'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              width10,
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: (() {
                  Get.to(() => const MapLocationScreen());
                }),
                icon: const Icon(
                  Icons.my_location,
                  color: Colors.white,
                ),
                label: const Text(
                  'Use my location',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          height10,
          Row(
            children: [
              SizedBox(
                width: 170,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('State (Required)*'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              width10,
              SizedBox(
                width: 170,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('City (Required)*'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          height10,
          TextFormField(
            decoration: const InputDecoration(
              label: Text('House No.,Building Name (Required)*'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height10,
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Road name ,Area,Colony (Required)*'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          height20,
          const Text('Type of address'),
          height10,
          Row(
            children: [
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: (() {}),
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              width20,
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: (() {}),
                icon: const Icon(
                  Icons.home_work_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Work',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          height10,
          InkWell(
            onTap: () {
              Get.off(() => const ShippingAddress());
            },
            child: Container(
              width: 250,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
