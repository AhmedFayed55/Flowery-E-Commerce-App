import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/best_saller_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/category_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/occasion_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/product_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/use_cases/home_use_case.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_bloc.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_event.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeUseCase])
void main() {
  late MockHomeUseCase mockHomeUseCase;
  late HomeEntity homeEntity;
  late ApiSuccessResult<HomeEntity> successResult;
  setUp(() {
    mockHomeUseCase = MockHomeUseCase();
    homeEntity = const HomeEntity(
      bestSallerEntity: [
        BestSallerEntity(
          "title",
          "description",
          "imgCover",
          [],
          0,
          0,
          0,
          0,
          "id",
        ),
      ],
      productEntity: [
        ProductEntity("id", "title", "description", "imgCover", [], 0, 0, 0, 0),
      ],
      occasionEntity: [OccasionEntity("id", "name", "image")],
      categoryEntity: [CategoryEntity("id", "name", "image")],
    );
    successResult = ApiSuccessResult(data: homeEntity);
    provideDummy<ApiResult<HomeEntity>>(successResult);
  });

  group('bloc Test', () {
    blocTest<HomeBloc, HomeState>(
      'should emit[loadding , success] when homeUseCase return success',
      build: () {
        when(mockHomeUseCase.call()).thenAnswer((_) async => successResult);
        return HomeBloc(mockHomeUseCase);
      },
      act: (bloc) => bloc.doIntent(GetHomeDataEvent()),
      verify: (_) {
        verify(mockHomeUseCase.call()).called(1);
      },
      expect: () => [
        HomeState(isLoadding: true, homeEntity: null, errorMassage: ''),
        HomeState(isLoadding: false, homeEntity: homeEntity, errorMassage: ''),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'should emit[loadding, failure] when homeuseCase return failure',
      build: () {
        final errorResult = ApiErrorResult<HomeEntity>(
          failure: Failure(errorMessage: 'something error'),
        );

        when(mockHomeUseCase.call()).thenAnswer((_) async => errorResult);
        return HomeBloc(mockHomeUseCase);
      },
      act: (bloc) => bloc.doIntent(GetHomeDataEvent()),
      verify: (bloc) {
        verify(mockHomeUseCase.call()).called(1);

      },
      expect: ()=> [
        HomeState(isLoadding: true),
        HomeState(errorMassage: 'something error')
      ]
        
      ,
    );
  });
}
