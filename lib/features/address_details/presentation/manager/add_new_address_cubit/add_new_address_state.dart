import 'package:equatable/equatable.dart';

class AddressDetailsState extends Equatable {
  final bool isSuccess;
  final bool isLoading;
  final String? errorMsg;

  final bool isLoadingGetPLaces;
  final String? errorGetCities;
  final String? errorGetAreas;
  final List<String> cities;
  final List<String> areas;

  const AddressDetailsState({
    this.cities = const [],
    this.areas = const [],
    this.errorMsg,
    this.errorGetCities,
    this.errorGetAreas,
    this.isSuccess = false,
    this.isLoading = false,
    this.isLoadingGetPLaces = false,
  });

  AddressDetailsState copyWith({
    String? errorMsg,
    String? errorGetCities,
    String? errorGetAreas,
    bool? isSuccess,
    bool? isLoading,
    bool? isLoadingGetPLaces,
    List<String>? cities,
    List<String>? areas,
  }) {
    return AddressDetailsState(
      errorMsg: errorMsg ?? this.errorMsg,
      errorGetAreas: errorGetAreas ?? this.errorGetAreas,
      errorGetCities: errorGetCities ?? this.errorGetCities,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      isLoadingGetPLaces: isLoadingGetPLaces ?? this.isLoadingGetPLaces,
      areas: areas ?? this.areas,
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => [
    isSuccess,
    isLoading,
    errorMsg,
    isLoadingGetPLaces,
    errorGetCities,
    errorGetAreas,
    cities,
    areas,
  ];
}
