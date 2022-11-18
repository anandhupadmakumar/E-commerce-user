import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelProductToJson(ProductModel data) => json.encode(data);

class ProductModel {
  ProductModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productStock,
    required this.productDescription,
    required this.productBrand,
    required this.productImage,
    required this.productCategory,
  });

  String id;
  String productName;
  int productPrice;
  int productStock;
  String productDescription;
  String productBrand;
  String productImage;
  String productCategory;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productStock: json["product_stock"],
        productDescription: json["product_description"],
        productBrand: json["product_brand"],
        productImage: json["product_image"],
        productCategory: json["product_category"],
      );
}
