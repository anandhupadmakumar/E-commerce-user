import 'package:clippy_flutter/arc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/cart_controller.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/model/my_cart_model/my_cart_model.dart';
import 'package:shoe_cart/view/cart/cart_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

import '../../controller/wishlist_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen(
      {super.key,
      required this.productTitle,
      required this.productPrice,
      required this.productImage,
      required this.productOffer});
  final String productImage;
  final String productTitle;
  final String productPrice;
  final String productOffer;
  final UserController userControllerProduct = Get.put(UserController());
  CartController _cartController = Get.put(CartController());
  final WishListController wishController = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(title: 'Product Details'),
      ),
      body: ListView(
        children: [
          Image.network(
            productImage,
            height: 160,
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              // alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .60,

              color: const Color.fromARGB(255, 254, 254, 254),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.red,
                                  ),
                                  width20,
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.green,
                                  ),
                                  width20,
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            height20,
                            Text(
                              productTitle,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '₹$productPrice',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: wishController.wishlistProductName
                                  .contains(productTitle)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RatingBar.builder(
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          userControllerProduct.productCountDecrement();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: GetBuilder<UserController>(builder: (data) {
                          return Text('${data.itemCount}');
                        }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          userControllerProduct.productCountIncrement();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  height20,
                  const Divider(
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Discription',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(productOffer),
                  ),
                  height20,
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  height20,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Text('40'),
                              ),
                            ),
                            width20,
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Text('50'),
                              ),
                            ),
                            width20,
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Text('60'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: (() {
          final addProduct = MyCartModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            productName: productTitle,
            productPrice: int.parse(productPrice) *
                int.parse(userControllerProduct.itemCount.toString()),
            size: '40',
            itemCount: userControllerProduct.itemCount.toString(),
            productImage: productImage,
            color: 'green',
          );
          _cartController.addProdutUserCart(addProduct);

          Get.to(() => CartScreen());
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: 180,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void createProduct() async {
  //   final addProduct = MyCartModel(
  //     id: '',
  //     productName: productTitle,
  //     productPrice: int.parse(productPrice),
  //     size: '40',
  //     itemCount: userControllerProduct.itemCount.toString(),
  //     productImage: productImage,
  //     color: 'green',
  //   );

  //   final docUser = FirebaseFirestore.instance
  //       .collection('user_datas')
  //       .doc(FirebaseAuth.instance.currentUser!.uid[1]);
  //   // addProduct.id = docUser.id;

  //   final json = addProduct.toJson();

  //   await docUser.set(json);
  //   Get.to(() => CartScreen());
  // }
}
