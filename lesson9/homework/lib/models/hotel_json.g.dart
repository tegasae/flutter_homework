// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      json['uuid'] as String,
      json['name'] as String,
      json['poster'] as String? ?? '',
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelDetails _$HotelDetailsFromJson(Map<String, dynamic> json) => HotelDetails(
      json['uuid'] as String,
      json['name'] as String,
      json['poster'] as String,
      (json['price'] as num).toDouble(),
      (json['rating'] as num).toDouble(),
      Services.fromJson(json['services'] as Map<String, dynamic>),
      Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelDetailsToJson(HotelDetails instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'price': instance.price,
      'rating': instance.rating,
      'address': instance.address.toJson(),
      'services': instance.services.toJson(),
      'photos': instance.photos,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['country'] as String,
      json['street'] as String,
      json['city'] as String,
      json['zip_code'] as int,
      (json['coords'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'coords': instance.coords,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
