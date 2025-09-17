import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/data_sources/home_ds.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/home_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/repositories/home_repo_imp.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_imp_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  group('HomeRepo', () {
    MockHomeDataSource mockHomeDataSource = MockHomeDataSource();
    HomeRepoImp mockHomeRepo = HomeRepoImp(mockHomeDataSource);

    test(
      'when call homeData is should call homeData from DataSource on success',
      () async {
        HomeResponseDto mockHomeResponceDto = const HomeResponseDto(
          message: '',
          products: [],
          categories: [],
          bestSeller: [],
          occasions: [],
        );

        when(
          mockHomeDataSource.homeDataSource(),
        ).thenAnswer((_) async => mockHomeResponceDto);

        var result = await mockHomeRepo.homeRepo();
        verify(mockHomeDataSource.homeDataSource()).called(1);
        expect(result, isA<ApiSuccessResult<HomeEntity>>());
      },
    );

    test(
      'when call homeData is should call homeData from DataSource on faliuer',
      () async {
        when(
          mockHomeDataSource.homeDataSource(),
        ).thenThrow(Exception('some thing wrong'));
        var result = await mockHomeRepo.homeRepo();
        verify(mockHomeDataSource.homeDataSource()).called(1);
        expect(result, isA<ApiErrorResult<HomeEntity>>());
      },
    );
  });
}
