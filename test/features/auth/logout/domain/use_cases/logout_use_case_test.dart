import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/repositories/logout_repo.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/use_cases/logout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_use_case_test.mocks.dart';

@GenerateMocks([LogoutRepo])
void main() {
  final LogoutRepo repo = MockLogoutRepo();
  final LogoutUseCase useCase = LogoutUseCase(repo);

  final LogoutResponseEntity expectedResponse = LogoutResponseEntity(
    message: "Good",
  );

  provideDummy<ApiResult<LogoutResponseEntity>>(
    ApiSuccessResult<LogoutResponseEntity>(data: expectedResponse),
  );

  test(
    'When call invoke fun should return ApiSuccessResult when repo returns success',
    () async {
      when(repo.logout()).thenAnswer(
        (_) async =>
            ApiSuccessResult<LogoutResponseEntity>(data: expectedResponse),
      );

      final result = await useCase.invoke();

      verify(repo.logout()).called(1);
      expect(result, isA<ApiSuccessResult<LogoutResponseEntity>>());
      result as ApiSuccessResult<LogoutResponseEntity>;
      expect(result.data, equals(expectedResponse));
    },
  );
}
