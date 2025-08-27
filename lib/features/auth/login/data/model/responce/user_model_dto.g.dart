// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) => UserModelDto(
  json['_id'] as String,
  json['firstName'] as String,
  json['lastName'] as String,
  json['email'] as String,
  json['gender'] as String,
  json['phone'] as String,
  json['photo'] as String,
  json['role'] as String,
  json['wishlist'] as List<dynamic>,
  json['addresses'] as List<dynamic>,
  json['createdAt'] as String,
);

Map<String, dynamic> _$UserModelDtoToJson(UserModelDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'wishlist': instance.wishlist,
      'addresses': instance.addresses,
      'createdAt': instance.createdAt,
    };
