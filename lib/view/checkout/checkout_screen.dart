import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/cart_controller.dart';
import 'package:shoe_cart/controller/promo_code_controller.dart';
import 'package:shoe_cart/view/notification/notification_screen.dart';
import 'package:shoe_cart/view/payment_methods/payment_methods.dart';
import 'package:shoe_cart/view/promo_code/promo_code_screen.dart';
import 'package:shoe_cart/view/shipping_address/shipping_address.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';
import 'package:shoe_cart/view/widgets/brand_container_widget.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key, this.offerValue = 1});
  CartController cartController = Get.put(CartController());
  // final promocodeController = Get.put(PromoCodeController());
  int offerValue = 1;
  int deliverycharge = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check Out',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              // deliverycharge = 0;
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Text(
            'Shipping Address',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          height20,
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(color: Colors.black)),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Center(
                  child: Icon(Icons.location_on),
                ),
              ),
              title: const Text('Home'),
              subtitle: const Text('61480 sunbrook park,Pc 5679'),
              trailing: IconButton(
                onPressed: () {
                  Get.off(() => ShippingAddress());
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          height20,
          const Text(
            'Order List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                isThreeLine: true,
                leading: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image(
                      image: NetworkImage(
                          cartController.userCart[index]['product_image'])),
                ),
                title: const Text("Duke Men's Shoes"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Black | Size=42'),
                    Row(
                      children: [
                        Text(''),
                        Spacer(),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black,
                          child: Text(
                              cartController.userCart[index]['item_count']),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => height20,
            itemCount: cartController.userCart.length,
          ),
          height20,
          const Text(
            'Promo Code',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter promo code',
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => PromoCodeScreen());
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                  child: Text('+'),
                ),
              )
            ],
          ),
          height20,
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              children: [
                height20,
                height20,
                Row(
                  children: [
                    width20,
                    const Text('Amount'),
                    const Spacer(),
                    Text('₹ ${cartController.totalprice}'),
                    width20
                  ],
                ),
                height20,
                Row(
                  children: const [
                    width20,
                    Text('Delivery charge'),
                    Spacer(),
                    Text(' ₹ 40'),
                    width20
                  ],
                ),
                height20,
                // Row(
                //   children: [
                //     width20,
                //     const Text('Promo Code'),
                //     const Spacer(),
                //     Obx(

                //       () => Text(
                //         promocodeController.percentage.value.toString(),
                //       ),
                //     ),
                //     width20,
                //   ],
                // ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  children: [
                    width20,
                    const Text('Total Amount'),
                    const Spacer(),
                    Text(
                      offerValue == 1
                          ? '₹ ${(cartController.totalprice + deliverycharge)}'
                          : '₹ ${(cartController.totalprice + 40) * offerValue / 100}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    width20,
                  ],
                )
              ],
            ),
          ),
          height20,
          InkWell(
            onTap: (() {
              Get.to(() => PaymentMethodScreen());
            }),
            child: Container(
              width: 80,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  'Continue to payment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
