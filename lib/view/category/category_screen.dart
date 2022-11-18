import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';
import 'package:shoe_cart/view/widgets/gridview_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(title: title),
      ),
      body: SingleChildScrollView(child: GridviewWidget()),
    );
  }
}
