// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';

// ignore: must_be_immutable
class HomeState extends Equatable {
  bool isLoadding = false;
  String errorMassage = '';
  HomeEntity? homeEntity;
  HomeState({this.isLoadding = false, this.errorMassage = '', this.homeEntity});

  HomeState copyWith({
    bool? isLoadding,
    String? errorMassage,
    HomeEntity? homeEntity,
  }) {
    return HomeState(
      isLoadding: isLoadding ?? this.isLoadding,
      errorMassage: errorMassage ?? this.errorMassage,
      homeEntity: homeEntity ?? this.homeEntity,
    );
  }

  @override
  List<Object?> get props => [isLoadding, errorMassage, homeEntity];
}
