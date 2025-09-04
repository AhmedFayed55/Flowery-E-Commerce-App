import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/products_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/use_cases/get_specific_occasions_use_case.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/manager/occasions_cubit.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/manager/occasions_event.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/manager/occasions_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasions_cubit_test.mocks.dart';

@GenerateMocks([GetSpecificOccasionsUseCase])
void main() {
  group("occasions view model test", () {
    final GetSpecificOccasionsUseCase useCase =
        MockGetSpecificOccasionsUseCase();
    final occasionsResponse = OccasionsResponseEntity(
      products: [
        ProductsEntity(sold: 5, id: "1", occasion: "1"),
        ProductsEntity(sold: 2, id: "2", occasion: "2"),
      ],
    );
    final ApiResult<OccasionsResponseEntity> successResponse =
        ApiSuccessResult<OccasionsResponseEntity>(data: occasionsResponse);
    final ApiResult<OccasionsResponseEntity> errorResponse = ApiErrorResult(
      failure: Failure(errorMessage: "Something went wrong"),
    );

    provideDummy<ApiResult<OccasionsResponseEntity>>(successResponse);

    blocTest<OccasionsCubit, OccasionsState>(
      "call doIntent with LoadOccasionsEvent then call _loadOccasions and return success",
      build: () {
        when(useCase.invoke()).thenAnswer((_) async => successResponse);
        return OccasionsCubit(useCase);
      },
      act: (viewModel) async =>
          await viewModel.doIntent(LoadOccasionsEvent(), "1"),
      expect: () => [
        const OccasionsState(isLoadingGetOccasion: true, products: []),
        OccasionsState(
          isLoadingGetOccasion: false,
          products: [occasionsResponse.products!.first], // filteration by id
        ),
      ],
      verify: (_) => verify(useCase.invoke()).called(1),
    );

    blocTest<OccasionsCubit, OccasionsState>(
      "call doIntent with LoadOccasionsEvent then call _loadOccasions and return Error",
      build: () {
        when(useCase.invoke()).thenAnswer((_) async => errorResponse);
        return OccasionsCubit(useCase);
      },
      act: (viewModel) async =>
          await viewModel.doIntent(LoadOccasionsEvent(), "1"),
      expect: () => [
        const OccasionsState(isLoadingGetOccasion: true, products: []),
        const OccasionsState(
          isLoadingGetOccasion: false,
          errorGetOccasion: "Something went wrong",
          products: [],
        ),
      ],
      verify: (_) => verify(useCase.invoke()).called(1),
    );

    blocTest<OccasionsCubit, OccasionsState>(
      "emits cached data when available without calling useCase again",
      build: () {
        final viewModel = OccasionsCubit(useCase);
        viewModel.cachedOccasions["1"] = [occasionsResponse.products!.first];
        return viewModel;
      },
      act: (cubit) async => await cubit.doIntent(LoadOccasionsEvent(), "1"),
      expect: () => [
        OccasionsState(products: [occasionsResponse.products!.first]),
      ],
      verify: (_) => verifyNever(MockGetSpecificOccasionsUseCase().invoke()),
    );
  });
}
