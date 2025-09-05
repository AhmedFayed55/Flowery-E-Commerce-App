import 'package:equatable/equatable.dart';

class OccasionEntity extends Equatable {
  final String id;
  final String name;
  final String image;

  const OccasionEntity(this.id, this.name, this.image);

  @override
  List<Object?> get props => [id, name, image];
}
