import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_cart/constants/constants.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';
import 'package:shoe_cart/view/widgets/carasol_card_widget.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBarWidget(title: 'Special Offer')),
      body: ListView.separated(
          padding:  const EdgeInsets.symmetric(horizontal: 40),
          itemBuilder: (context, index) {
            return CarasoleCard(index: index);
          },
          separatorBuilder: (context, index) {
            return height20;
          },
          itemCount: 10),
    );
  }
}
