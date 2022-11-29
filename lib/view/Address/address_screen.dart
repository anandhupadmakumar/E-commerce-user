import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/address_controller.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/address/address_model.dart';
import 'package:shoe_cart/view/location/map_location_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final pinCodeController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final houseNumberController = TextEditingController();
  final roadNameController = TextEditingController();
  final controller = Get.put(UserController());
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    // print(placeMark[0].name);
    if (placeMark.isEmpty) {
      print('object');
    } else {
      print(placeMark);
      nameController.text = controller.loggedInuser?.fullName ?? '';
      phoneNumberController.text = controller.loggedInuser?.phoneNumber ?? '';
      pinCodeController.text = placeMark[0].postalCode ?? '';
      stateController.text = placeMark[0].administrativeArea ?? '';
      cityController.text = placeMark[0].locality ?? "";
      roadNameController.text = placeMark[0].name ?? '';
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Address'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          height10,
          height10,
          TextFormField(
            controller: nameController,
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
            controller: phoneNumberController,
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
                  controller: pinCodeController,
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
                  Get.to(() => MapLocationScreen());
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
                  controller: stateController,
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
                  controller: cityController,
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
            controller: houseNumberController,
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
            controller: roadNameController,
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
              final addAddress = AddressModel(
                name: nameController.text,
                phoneNumber: phoneNumberController.text,
                pinCode: pinCodeController.text,
                state: stateController.text,
                city: cityController.text,
                houseNumber: houseNumberController.text,
                roadName: roadNameController.text,
              );

              addressController.addAddressList(addAddress);

              // Get.off(() => const ShippingAddress());
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
