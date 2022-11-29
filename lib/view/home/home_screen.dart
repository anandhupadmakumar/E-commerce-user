import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/view/cart/cart_screen.dart';
import 'package:shoe_cart/view/home/most_popular/most_popular_screen.dart';
import 'package:shoe_cart/view/home/special_offer/special_offer_screen.dart';
import 'package:shoe_cart/view/notification/notification_screen.dart';
import 'package:shoe_cart/view/order/order_screen.dart';
import 'package:shoe_cart/view/profile/profile_screen.dart';
import 'package:shoe_cart/view/wishlist/wishlist_screen.dart';
import '../widgets/brand_container_widget.dart';
import '../widgets/carasol_card_widget.dart';
import '../widgets/category_avatar_widget.dart';
import '../widgets/gridview_widget.dart';
import '../widgets/special_title_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final currentIndex = 0;
  final UserController userFullnamecontroller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userFullnamecontroller.getuser();
    return Scaffold(
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      //     boxShadow: [
      //       BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(30.0),
      //       topRight: Radius.circular(30.0),
      //     ),
      //     child: BottomNavigationBar(
      //       onTap: ((value) {}),
      //       showUnselectedLabels: true,
      //       selectedItemColor: Colors.black,
      //       unselectedItemColor: Colors.grey,
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.home_outlined), label: 'Home'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.shopping_cart_outlined), label: 'Order'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.wallet_travel), label: 'Wallet'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.person_outline), label: 'Profile'),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                userFullnamecontroller.loggedInuser?.imageUrl ?? ''),
            backgroundColor: Colors.grey,
          ),
        ),
        backgroundColor: const Color.fromARGB(28, 33, 149, 243),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning 😊 ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              userFullnamecontroller.loggedInuser?.fullName ?? 'Name',
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                  duration: const Duration(milliseconds: 1000),
                  transition: Transition.fadeIn,
                  () => WishListScreen());
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {
                Get.to(() => const NotificationScreen());
              },
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CupertinoSearchTextField(),
              ),
              const SpecialTitleWidget(
                screen: SpecialOfferScreen(),
                title: 'Special Offer',
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CarasoleCard(
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CategoryAvatarWidget(
                    categoryName: 'Casuals',
                  ),
                  CategoryAvatarWidget(
                    categoryName: 'Formals',
                  ),
                  CategoryAvatarWidget(
                    categoryName: 'Sports',
                  ),
                ],
              ),
              const SpecialTitleWidget(
                screen: MostPopularScreen(),
                title: 'Most Popular',
              ),
              SizedBox(
                height: 60,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BrandWidget(
                      content: 'All',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    BrandWidget(
                      content: 'Nike',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    BrandWidget(
                      content: 'Puma',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    BrandWidget(
                      content: 'Adidas',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    BrandWidget(
                      content: 'Rebook',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              GridviewWidget()
            ],
          ),
        ),
      ),
    );
  }
}

List screens = [HomeScreen(), CartScreen(), OrderScreen(), ProfileScreen()];
