import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  AddressModel({
    this.name,
    this.phoneNumber,
    this.pinCode,
    this.state,
    this.city,
    this.houseNumber,
    this.roadName,
  });
  String? name;
  String? phoneNumber;
  String? pinCode;
  String? state;
  String? city;
  String? houseNumber;
  String? roadName;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(

    name:json['name'],
    phoneNumber: json['phone_number'],
    pinCode: json['pincode'],
    state: json['state'],
    city: json['city'],
    houseNumber: json['house_number'],
    roadName: json['road_name'],
  );

  Map<String, dynamic> toJson() => {
        "user_address": FieldValue.arrayUnion(
          [
            {
              "name": name,
              "phone_number": phoneNumber,
              "pincode": pinCode,
              "state": state,
              "city": city,
              "house_number": houseNumber,
              "road_name": roadName
            }
          ],
        ),
      };
}
