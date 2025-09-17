import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/data/data_sources/logout_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/data/models/logout_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../change_password/data/data_sources/change_password_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices, TokenService])
void main() {
  final ApiServices apiServices = MockApiServices();
  final TokenService tokenService = MockTokenService();
  final LogoutDataSourceImpl dataSource = LogoutDataSourceImpl(
    apiServices,
    tokenService,
  );

  test(
    'verify when call logout it should call logout from ApiServices',
    () async {
      final expectedResponse = LogoutResponseDto(message: "Good");

      const String token = "asfaf";

      when(tokenService.getToken()).thenAnswer((_) async => token);
      when(
        apiServices.logout("${AppConstants.bearer} $token"),
      ).thenAnswer((_) async => expectedResponse);

      var result = await dataSource.logout();

      verify(tokenService.getToken()).called(1);
      verify(apiServices.logout("${AppConstants.bearer} $token")).called(1);

      expect(result, isA<LogoutResponseDto>());
      expect(result.message, equals(expectedResponse.message));
    },
  );
}
