import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/addresses_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/area_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_data_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/use_cases/add_new_address_use_case.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/use_cases/get_areas_use_case.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/use_cases/get_cities_use_case.dart';
import 'package:flowers_ecommerce_app/features/address_details/presentation/manager/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:flowers_ecommerce_app/features/address_details/presentation/manager/add_new_address_cubit/add_new_address_event.dart';
import 'package:flowers_ecommerce_app/features/address_details/presentation/manager/add_new_address_cubit/add_new_address_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_new_address_cubit_test.mocks.dart';

@GenerateMocks([AddNewAddressUseCase, GetCitiesUseCase, GetAreasUseCase])
void main() {
  late MockAddNewAddressUseCase mockAddNewAddressUseCase;
  late MockGetCitiesUseCase mockGetCitiesUseCase;
  late MockGetAreasUseCase mockGetAreasUseCase;
  late AddressDetailsCubit cubit;

  setUp(() {
    mockAddNewAddressUseCase = MockAddNewAddressUseCase();
    mockGetCitiesUseCase = MockGetCitiesUseCase();
    mockGetAreasUseCase = MockGetAreasUseCase();
    cubit = AddressDetailsCubit(
      mockAddNewAddressUseCase,
      mockGetCitiesUseCase,
      mockGetAreasUseCase,
    );
  });

  group("AddressDetailsCubit tests", () {
    final successAddressResponse = ApiSuccessResult<AddressesResponseEntity>(
      data: AddressesResponseEntity(),
    );
    final errorAddressResponse = ApiErrorResult<AddressesResponseEntity>(
      failure: Failure(errorMessage: "error"),
    );

    final successCitiesResponse = ApiSuccessResult<CitiesResponseEntity>(
      data: CitiesResponseEntity(
        data: [CitiesDataResponseEntity(governorateNameEn: "Cairo")],
      ),
    );
    final errorCitiesResponse = ApiErrorResult<CitiesResponseEntity>(
      failure: Failure(errorMessage: "cities error"),
    );

    final successAreasResponse = ApiSuccessResult<AreaResponseEntity>(
      data: AreaResponseEntity(
        data: [AreaDataResponseEntity(cityNameEn: "Nasr City")],
      ),
    );
    final errorAreasResponse = ApiErrorResult<AreaResponseEntity>(
      failure: Failure(errorMessage: "areas error"),
    );

    provideDummy<ApiResult<AddressesResponseEntity>>(successAddressResponse);
    provideDummy<ApiResult<CitiesResponseEntity>>(successCitiesResponse);
    provideDummy<ApiResult<AreaResponseEntity>>(successAreasResponse);

    blocTest<AddressDetailsCubit, AddressDetailsState>(
      "emits [loading, success] when addNewAddress succeeds",
      build: () {
        when(
          mockAddNewAddressUseCase.invoke(any),
        ).thenAnswer((_) async => successAddressResponse);
        return cubit;
      },
      act: (cubit) async => await cubit.doIntent(AddNewAddressEvent()),
      expect: () => [
        const AddressDetailsState(isLoading: true, isSuccess: false),
        const AddressDetailsState(isLoading: false, isSuccess: true),
      ],
    );

    blocTest<AddressDetailsCubit, AddressDetailsState>(
      "emits [loading, error] when addNewAddress fails",
      build: () {
        when(
          mockAddNewAddressUseCase.invoke(any),
        ).thenAnswer((_) async => errorAddressResponse);
        return cubit;
      },
      act: (cubit) async => await cubit.doIntent(AddNewAddressEvent()),
      expect: () => [
        const AddressDetailsState(isLoading: true, isSuccess: false),
        const AddressDetailsState(isLoading: false, errorMsg: "error"),
      ],
    );

    blocTest<AddressDetailsCubit, AddressDetailsState>(
      "emits cities when getCities succeeds",
      build: () {
        when(
          mockGetCitiesUseCase.invoke(),
        ).thenAnswer((_) async => successCitiesResponse);

        when(mockGetAreasUseCase.invoke()).thenAnswer(
          (_) async =>
              ApiSuccessResult(data: AreaResponseEntity(data: const [])),
        );
        return cubit;
      },
      act: (cubit) async => await cubit.doIntent(GetAreasAndCitiesEvent()),
      expect: () => [
        const AddressDetailsState(isLoadingGetPLaces: true),
        const AddressDetailsState(isLoadingGetPLaces: false, cities: ["Cairo"]),
        const AddressDetailsState(isLoadingGetPLaces: true, cities: ["Cairo"]),
        const AddressDetailsState(
          isLoadingGetPLaces: false,
          cities: ["Cairo"],
          areas: [],
        ),
      ],
    );

    blocTest<AddressDetailsCubit, AddressDetailsState>(
      "emits error when getCities fails",
      build: () {
        when(
          mockGetCitiesUseCase.invoke(),
        ).thenAnswer((_) async => errorCitiesResponse);

        when(mockGetAreasUseCase.invoke()).thenAnswer(
          (_) async =>
              ApiSuccessResult(data: AreaResponseEntity(data: const [])),
        );

        return cubit;
      },
      act: (cubit) async => await cubit.doIntent(GetAreasAndCitiesEvent()),
      expect: () => [
        const AddressDetailsState(isLoadingGetPLaces: true),
        const AddressDetailsState(
          isLoadingGetPLaces: false,
          errorGetCities: "cities error",
        ),
        const AddressDetailsState(
          isLoadingGetPLaces: true,
          errorGetCities: "cities error",
        ),
        const AddressDetailsState(
          isLoadingGetPLaces: false,
          errorGetCities: "cities error",
          areas: [],
        ),
      ],
    );

    blocTest<AddressDetailsCubit, AddressDetailsState>(
      "emits areas when getAreas succeeds",
      build: () {
        when(mockGetCitiesUseCase.invoke()).thenAnswer(
          (_) async =>
              ApiSuccessResult(data: CitiesResponseEntity(data: const [])),
        );

        when(
          mockGetAreasUseCase.invoke(),
        ).thenAnswer((_) async => successAreasResponse);

        return cubit;
      },
      act: (cubit) async => cubit.doIntent(GetAreasAndCitiesEvent()),
      expect: () => [
        const AddressDetailsState(
          isLoadingGetPLaces: true,
          errorGetAreas: null,
        ),
        const AddressDetailsState(isLoadingGetPLaces: false, areas: []),
        const AddressDetailsState(isLoadingGetPLaces: true, areas: []),
        const AddressDetailsState(
          isLoadingGetPLaces: false,
          areas: ["Nasr City"],
        ),
      ],
    );

    blocTest<AddressDetailsCubit, AddressDetailsState>(
      "emits error when getAreas fails",
      build: () {
        when(
          mockGetAreasUseCase.invoke(),
        ).thenAnswer((_) async => errorAreasResponse);

        when(mockGetCitiesUseCase.invoke()).thenAnswer(
          (_) async =>
              ApiSuccessResult(data: CitiesResponseEntity(data: const [])),
        );

        return cubit;
      },
      act: (cubit) async => cubit.doIntent(GetAreasAndCitiesEvent()),
      expect: () => [
        const AddressDetailsState(
          isLoadingGetPLaces: true,
          errorGetAreas: null,
        ),
        const AddressDetailsState(isLoadingGetPLaces: false, areas: []),
        const AddressDetailsState(isLoadingGetPLaces: true, areas: []),
        const AddressDetailsState(
          isLoadingGetPLaces: false,
          errorGetCities: "areas error",
          areas: [],
        ),
      ],
    );
  });
}
