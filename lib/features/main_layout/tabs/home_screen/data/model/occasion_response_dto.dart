import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/occasion_entity.dart';

part 'occasion_response_dto.g.dart';

@JsonSerializable()
class OccasionResponseDto extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;
const  OccasionResponseDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
  });

  factory OccasionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OccasionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OccasionResponseDtoToJson(this);

  OccasionEntity toDomain() {
    return OccasionEntity(id ?? '', name ?? '', image ?? '');
  }
  
  @override
  List<Object?> get props => [id,name,image];
}
