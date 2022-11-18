import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/view/category/category_screen.dart';

class CategoryAvatarWidget extends StatelessWidget {
  const CategoryAvatarWidget({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => CategoryScreen(title: categoryName));
          },
          child: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
                'asset/images/244-2441597_nike-shoes-for-men-transparent-hd-png-download.png'),
          ),
        ),
        Text(categoryName)
      ],
    );
  }
}
