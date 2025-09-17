import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/use_cases/get_all_addresses_use_case.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/use_cases/remove_address_use_case.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/presentation/manager/user_addresses_cubit.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/presentation/manager/user_addresses_event.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/presentation/manager/user_addresses_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_addresses_cubit_test.mocks.dart';

@GenerateMocks([GetAllAddressesUseCase, RemoveAddressUseCase])
void main() {
  provideDummy<ApiResult<List<UserAddressDataEntity>>>(
    ApiSuccessResult<List<UserAddressDataEntity>>(data: const []),
  );

  group("UserAddressesCubit tests", () {
    late MockGetAllAddressesUseCase getAllAddressesUseCase;
    late MockRemoveAddressUseCase removeAddressUseCase;
    late UserAddressesCubit cubit;

    final List<UserAddressDataEntity> fakeAddresses = [
      UserAddressDataEntity(id: "1", street: "Street 1"),
      UserAddressDataEntity(id: "2", street: "Street 2"),
    ];

    setUp(() {
      getAllAddressesUseCase = MockGetAllAddressesUseCase();
      removeAddressUseCase = MockRemoveAddressUseCase();
      cubit = UserAddressesCubit(getAllAddressesUseCase, removeAddressUseCase);
    });

    blocTest<UserAddressesCubit, UserAddressesState>(
      "emits success state when GetAllAddressesUseCase returns success",
      build: () {
        when(getAllAddressesUseCase.invoke()).thenAnswer(
          (_) async => ApiSuccessResult<List<UserAddressDataEntity>>(
            data: fakeAddresses,
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.doIntent(GetUserAddressesEvent()),
      expect: () => [
        const UserAddressesState(isLoadingGetAddresses: true, addresses: []),
        UserAddressesState(
          isLoadingGetAddresses: false,
          isSuccessGetAddresses: true,
          addresses: fakeAddresses,
        ),
      ],
      verify: (_) => verify(getAllAddressesUseCase.invoke()).called(1),
    );

    blocTest<UserAddressesCubit, UserAddressesState>(
      "emits error state when GetAllAddressesUseCase returns error",
      build: () {
        when(getAllAddressesUseCase.invoke()).thenAnswer(
          (_) async => ApiErrorResult<List<UserAddressDataEntity>>(
            failure: Failure(errorMessage: "Get addresses failed"),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.doIntent(GetUserAddressesEvent()),
      expect: () => [
        const UserAddressesState(isLoadingGetAddresses: true, addresses: []),
        const UserAddressesState(
          isLoadingGetAddresses: false,
          errorGetAddresses: "Get addresses failed",
          addresses: [],
        ),
      ],
      verify: (_) => verify(getAllAddressesUseCase.invoke()).called(1),
    );

    blocTest<UserAddressesCubit, UserAddressesState>(
      "emits success state when RemoveAddressUseCase returns success",
      build: () {
        when(removeAddressUseCase.invoke("1")).thenAnswer(
          (_) async => ApiSuccessResult<List<UserAddressDataEntity>>(
            data: fakeAddresses,
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.doIntent(RemoveAddressEvent("1")),
      expect: () => [
        const UserAddressesState(isLoadingRemoveAddress: true, addresses: []),
        UserAddressesState(
          isLoadingRemoveAddress: false,
          isSuccessRemoveAddress: true,
          addresses: fakeAddresses,
        ),
      ],
      verify: (_) => verify(removeAddressUseCase.invoke("1")).called(1),
    );

    blocTest<UserAddressesCubit, UserAddressesState>(
      "emits error state when RemoveAddressUseCase returns error",
      build: () {
        when(removeAddressUseCase.invoke("1")).thenAnswer(
          (_) async => ApiErrorResult<List<UserAddressDataEntity>>(
            failure: Failure(errorMessage: "Remove failed"),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.doIntent(RemoveAddressEvent("1")),
      expect: () => [
        const UserAddressesState(isLoadingRemoveAddress: true, addresses: []),
        const UserAddressesState(
          isLoadingRemoveAddress: false,
          errorRemoveAddress: "Remove failed",
          addresses: [],
        ),
      ],
      verify: (_) => verify(removeAddressUseCase.invoke("1")).called(1),
    );
  });
}
