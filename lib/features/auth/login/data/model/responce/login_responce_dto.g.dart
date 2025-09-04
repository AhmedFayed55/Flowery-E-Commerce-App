// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponceDto _$LoginResponceDtoFromJson(Map<String, dynamic> json) =>
    LoginResponceDto(
      message: json['message'] as String,
      user: UserModelDto.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResponceDtoToJson(LoginResponceDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };
