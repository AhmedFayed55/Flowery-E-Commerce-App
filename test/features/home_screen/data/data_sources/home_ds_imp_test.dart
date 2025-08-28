import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/data_sources/home_ds_imp.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/home_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../auth/register/data/source/auth_remote_data_sourse_imlp_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test('when call homeData is should call homedata From ApiServices', () async {
    HomeResponseDto mockHomeResponce =const HomeResponseDto(
      message: '',
      products: [],
      categories: [],
      bestSeller: [],
      occasions: [],
    );
    MockApiServices mockApiServices = MockApiServices();
    HomeDataSourceImp homeDataSourceImp = HomeDataSourceImp(mockApiServices);

    when(mockApiServices.homeData()).thenAnswer((_) async => mockHomeResponce);
    var result = await homeDataSourceImp.homeDataSource();
    verify(mockApiServices.homeData()).called(1);
    expect(result, equals(mockHomeResponce));
  });
}
