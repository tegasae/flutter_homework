import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'hotel_json.g.dart';

@JsonSerializable()
class Hotel {
  final String uuid;
  final String name;
  @JsonKey(defaultValue: "")
  final String poster;

  Hotel(this.uuid, this.name, this.poster);
  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable()
class HotelDetails {
  String uuid;
  String name;
  String poster;
  double price;
  double rating;
  Address address;
  Services services;
  List<String> photos;

  HotelDetails(this.uuid, this.name, this.poster, this.price, this.rating,this.services,this.address,this.photos);
  factory HotelDetails.fromJson(Map<String,dynamic> json) => _$HotelDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
}

@JsonSerializable()
class Address {
  String country;
  String street;
  String city;
  int  zip_code;
  Map<String,double> coords;

  Address(this.country, this.street, this.city, this.zip_code, this.coords);
  factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
  Map<String,dynamic> toJson() => _$AddressToJson(this);

}

@JsonSerializable()
class Services {
  List<String> free;
  List<String> paid;

  Services(this.free, this.paid);
  factory Services.fromJson(Map<String,dynamic> json) => _$ServicesFromJson(json);
  Map<String,dynamic> toJson()=> _$ServicesToJson(this);
}