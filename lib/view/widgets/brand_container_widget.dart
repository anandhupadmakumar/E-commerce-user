
import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
          child: Text(
        content,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )),
    );
  }
}