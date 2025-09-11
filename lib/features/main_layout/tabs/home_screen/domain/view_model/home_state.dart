import 'package:equatable/equatable.dart';
import '../entities/best_saller_entity.dart';
import '../entities/home_entity.dart';

// ignore: must_be_immutable
class HomeState extends Equatable {
  bool isLoadding = false;
  String errorMassage = '';
  HomeEntity? homeEntity;
  List<BestSallerEntity> products;
  HomeState({this.isLoadding = false, this.errorMassage = '', this.homeEntity,this.products = const []});

  HomeState copyWith({
    bool? isLoadding,
    String? errorMassage,
    HomeEntity? homeEntity,
    List<BestSallerEntity>? products
  }) {
    return HomeState(
      isLoadding: isLoadding ?? this.isLoadding,
      errorMassage: errorMassage ?? this.errorMassage,
      homeEntity: homeEntity ?? this.homeEntity,
        products: products ?? this.products
    );
  }
  
  @override
  List<Object?> get props => [isLoadding,errorMassage,homeEntity,products];
}
