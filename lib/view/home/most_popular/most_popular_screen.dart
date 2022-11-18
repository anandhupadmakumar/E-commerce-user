import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';
import 'package:shoe_cart/view/widgets/gridview_widget.dart';

class MostPopularScreen extends StatelessWidget {
  const MostPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
         
          preferredSize: Size.fromHeight(80),
           child: AppBarWidget(title: 'Most Popular'),),
      body: SingleChildScrollView(child: GridviewWidget()),
    );
  }
}
