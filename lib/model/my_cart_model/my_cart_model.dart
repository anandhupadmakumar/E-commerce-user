import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

MyCartModel productModelFromJson(String str) =>
    MyCartModel.fromJson(json.decode(str));

String productModelProductToJson(MyCartModel data) => json.encode(data);

class MyCartModel {
  MyCartModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.size,
    required this.itemCount,
    required this.productImage,
    required this.color,
  });

  String id;
  String productName;
  int productPrice;

  String size;
  String color;
  String productImage;
  String itemCount;

  factory MyCartModel.fromJson( Map<String, dynamic>json) => MyCartModel(
        id: json["id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        color: json["product_color"],
        size: json["product_size"],
        productImage: json["product_image"],
        itemCount: json["item_count"],
      );

  Map<String, dynamic> toJson() => {
        "UserCart": FieldValue.arrayUnion([
          {
            "id": id,
            "product_name": productName,
            "product_price": productPrice,
            "item_count": itemCount,
            "product_size": size,
            "product_color": color,
            "product_image": productImage,
          }
        ])
      };
      
}
