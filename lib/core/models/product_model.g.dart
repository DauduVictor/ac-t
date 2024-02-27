// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: json['price'] as num? ?? 0.0,
      quantity: json['quantity'] as int? ?? 0,
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
      'category': instance.category,
    };
