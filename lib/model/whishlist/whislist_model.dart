import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

WishListModel wishListtModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String productModelProductToJson(WishListModel data) => json.encode(data);

class WishListModel {
  WishListModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.size,
    
    required this.productImage,
    required this.color,
  });

  String id;
  String productName;
  int productPrice;

  String size;
  String color;
  String productImage;
 

  factory WishListModel.fromJson( Map<String, dynamic>json) => WishListModel(
        id: json["id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        color: json["product_color"],
        size: json["product_size"],
        productImage: json["product_image"],
       
      );

  Map<String, dynamic> toJson() => {
        "wishList": FieldValue.arrayUnion([
          {
            "id": id,
            "product_name": productName,
            "product_price": productPrice,
           
            "product_size": size,
            "product_color": color,
            "product_image": productImage,
          }
        ],),
      };
      
}
