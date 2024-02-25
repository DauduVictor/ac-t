// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseImpl _$$SignInResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignInResponseImpl(
      error: json['error'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$SignInResponseImplToJson(
        _$SignInResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
