import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/data_sources/login_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/mappers/login_mapper.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/login_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/user_model_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/repositories/login_repo_imp.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repo_imp_test.mocks.dart';

@GenerateMocks([LoginDataSource, TokenService])
void main() {
  group('test repo', () {
    late MockLoginDataSource mockLoginDataSource;
    late MockTokenService mockTokenService;
    late LoginRepoImp loginRepoImp;

    setUp(() async {
      mockLoginDataSource = MockLoginDataSource();
      mockTokenService = MockTokenService();

      await getIt.reset();
      getIt.registerLazySingleton<TokenService>(() => mockTokenService);

      loginRepoImp = LoginRepoImp(mockLoginDataSource);
    });
    LoginRequestEntity loginRequestEntity = const LoginRequestEntity(
      email: 'yahya22@',
      password: 'yahya22!',
    );
    final dto = toDto(loginRequestEntity);

    test(
      'verify loginRepo calls loginDataSource and saves token on success ',
      () async {
        final mockResponse = LoginResponceDto(
          message: '',
          token: 'token',
          user: const UserModelDto(
            id: 'sss',
            firstName: 'yahya',
            lastName: 'mohamed',
            email: 'yahya22@gmail.com',
            gender: 'male',
            phone: '',
            photo: '',
            role: '',
            wishlist: [],
            addresses: [],
            createdAt: '',
          ),
        );

        when(
          mockLoginDataSource.login(dto),
        ).thenAnswer((_) async => mockResponse);

        var result = await loginRepoImp.loginRepo(loginRequestEntity);

        verify(mockLoginDataSource.login(dto)).called(1);
        verify(mockTokenService.saveToken('token')).called(1);
        expect(result, isA<ApiSuccessResult<UserEntity>>());
      },
    );

    test('verify loginRepo calls loginDataSource on error', () async {
      when(
        mockLoginDataSource.login(dto),
      ).thenThrow(Exception('something wrong'));

      var result = await loginRepoImp.loginRepo(loginRequestEntity);
      verify(mockLoginDataSource.login(dto)).called(1);
      expect(result, isA<ApiErrorResult<UserEntity>>());
    });
  });
}
