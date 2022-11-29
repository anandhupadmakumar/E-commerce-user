import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/controller/cart_controller.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/view/payment_methods/payment_success/payment_success.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});
  final CartController _cartController = Get.put(CartController());
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Payment Methods'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // const ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: Center(
          //       child: Icon(Icons.wallet),
          //     ),
          //   ),
          //   title: Text('My Wallet'),
          //   trailing: Icon(
          //     Icons.radio_button_checked,
          //     color: Colors.black,
          //   ),
          // ),
          // height20,
          // const ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: Image(image: AssetImage('asset/images/googlepay.png')),
          //   ),
          //   title: Text('Google Pay'),
          //   trailing: Icon(
          //     Icons.radio_button_unchecked,
          //     color: Colors.black,
          //   ),
          // ),
          height20,
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image(image: AssetImage('asset/images/rasorpay.png')),
            ),
            title: Text('Razor Pay'),
            trailing: Icon(
              Icons.radio_button_checked,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 100,
          ),

          // GooglePayButton(
          //   paymentConfigurationAsset: 'gpay.json',
          //   paymentItems: [
          //     PaymentItem(amount: '${_cartController.totalprice}')
          //   ],
          //   type: GooglePayButtonType.buy,
          //   margin: const EdgeInsets.only(top: 15.0),
          //   onPaymentResult: (data) {
          //     print(data);
          //   },
          //   loadingIndicator: const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),

          InkWell(
            onTap: (() {
              var options = {
                'key': 'rzp_test_IunimYkegUhXsd',
                'amount': _cartController.totalprice.value,
                'name': '',
                'description': 'Fine T-Shirt',
                'prefill': {
                  'contact': controller.userPhoneNumber,
                  'email': FirebaseAuth.instance.currentUser!.email
                }
              };
              _cartController.razorpay.open(options);
              // Get.to(() => const PaymentSuccessScreen());
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
                  'Confirm Payment',
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
