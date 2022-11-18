import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

import '../../constants/constants.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

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
                    title: const Text('Special 25% off'),
                    subtitle: const Text('Spedial promo only today!'),
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
                itemCount: 5),
          ),
          Positioned(
            bottom: 20,
            left: 45,
            child: InkWell(
              onTap: () {
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
