import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/repositories/change_password_repo.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/use_cases/change_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ChangePasswordRepo])
void main() {

  final ChangePasswordRepo repo = MockChangePasswordRepo();
  final ChangePasswordUseCase useCase = ChangePasswordUseCase(repo);
  final ChangePasswordRequestEntity requestEntity = ChangePasswordRequestEntity(
      password: "1",newPassword: "2");
  final ChangePasswordResponseEntity expectedResponse = ChangePasswordResponseEntity(
      token: "aSC",message: "good");

  provideDummy<ApiResult<ChangePasswordResponseEntity>>(
    ApiSuccessResult<ChangePasswordResponseEntity>(data: expectedResponse)
  );

  test('When call invoke fun should return ApiSuccessResult when repo returns success', () async{

    when(repo.changePassword(requestEntity)).thenAnswer((_)
    async => ApiSuccessResult<ChangePasswordResponseEntity>(data: expectedResponse));

    final result = await useCase.invoke(requestEntity); 
    
    verify(repo.changePassword(requestEntity)).called(1);
    expect(result, isA<ApiSuccessResult<ChangePasswordResponseEntity>>());
    result as ApiSuccessResult<ChangePasswordResponseEntity>;
    expect(result.data, equals(expectedResponse));

  });
}