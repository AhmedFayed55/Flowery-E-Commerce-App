import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/view_model/login_bloc.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/view_model/login_event.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/view_model/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_bloc_test.mocks.dart';

@GenerateMocks([LoginUseCase, SharedPrefHelper])
void main() {
  late MockLoginUseCase mockLoginUseCase;
  late UserEntity userEntity;
  late LoginRequestEntity loginRequestEntity;
  late ApiResult<UserEntity> responce;

  setUp(() async {
    mockLoginUseCase = MockLoginUseCase();
    MockSharedPrefHelper mockSharedPrefHelper = MockSharedPrefHelper();
    when(
      mockSharedPrefHelper.saveData(key: anyNamed('key'), val: anyNamed('val')),
    ).thenAnswer((_) async => true);

    await getIt.reset();
    getIt.registerLazySingleton<SharedPrefHelper>(() => mockSharedPrefHelper);

    userEntity = const UserEntity(
      'yahya',
      'mohamed',
      'ym',
      'male',
      '',
      '',
      [],
      [],
    );

    loginRequestEntity = const LoginRequestEntity(
      email: 'yhaya22@',
      password: 'yahya22!',
    );

    responce = ApiSuccessResult(data: userEntity);

    provideDummy<ApiResult<UserEntity>>(responce);

    when(
      mockLoginUseCase.call(loginRequestEntity),
    ).thenAnswer((_) async => responce);
  });

  blocTest<LoginBloc, LoginState>(
    'emits [loading, success] when login succeeds',
    build: () => LoginBloc(mockLoginUseCase),
    act: (bloc) => bloc.doIntent(
      SumitLoginEvent(
        loginRequestEntity: loginRequestEntity,
        isRemember: false,
      ),
    ),
    expect: () => [
      LoginState(isLoadding: true),

      LoginState(isLoadding: false, userEntity: userEntity),
    ],
  );
}
