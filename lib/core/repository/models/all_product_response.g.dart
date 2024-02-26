// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllProductResponseImpl _$$AllProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AllProductResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllProductResponseImplToJson(
        _$AllProductResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
      'category': instance.category,
    };
