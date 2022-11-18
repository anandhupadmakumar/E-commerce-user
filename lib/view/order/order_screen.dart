import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/product_details/product_details_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'MY Orders',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(indicatorColor: Colors.grey, tabs: [
            Tab(
                child: Text(
              'Active',
              style: TextStyle(color: Colors.black),
            )),
            Tab(
                child: Text(
              'Completed',
              style: TextStyle(color: Colors.black),
            ))
          ]),
        ),
        body: TabBarView(children: [
          ListView(
            children: [
              height20,
              ListTile(
                onTap: (() {
                  // Get.to(() => const ProductDetailsScreen());
                }),
                isThreeLine: true,
                leading: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 70,
                  height: 70,
                  child:
                      const Image(image: AssetImage('asset/images/image.png')),
                ),
                title: Row(
                  children: const [
                    Text("Duke Men's Shoes"),
                    Spacer(),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Black | Size=42'),
                    Row(
                      children: const [
                        Text(' ₹2,279'),
                        Spacer(),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Color.fromARGB(255, 232, 178, 97),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            children: [
              height20,
              ListTile(
                onTap: (() {
                  // Get.to(() => const ProductDetailsScreen());
                }),
                isThreeLine: true,
                leading: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 70,
                  height: 70,
                  child:
                      const Image(image: AssetImage('asset/images/image.png')),
                ),
                title: Row(
                  children: const [
                    Text("Duke Men's Shoes"),
                    Spacer(),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Black | Size=42'),
                    Row(
                      children: const [
                        Text(' ₹2,279'),
                        Spacer(),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
