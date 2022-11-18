import 'package:flutter/material.dart';

import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/widgets/brand_container_widget.dart';

import 'package:shoe_cart/view/widgets/gridview_widget.dart';

import '../widgets/appbar_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBarWidget(
          title: 'Wish List',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height20,
            SizedBox(
              height: 40,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  BrandWidget(content: 'All'),
                  width20,
                  BrandWidget(content: 'Nike'),
                  width20,
                  BrandWidget(content: 'Puma'),
                  width20,
                  BrandWidget(content: 'Adidas'),
                  width20,
                  BrandWidget(content: 'Rebook'),
                ],
              ),
            ),
            const GridviewWidget(),
          ],
        ),
      ),
    );
  }
}

