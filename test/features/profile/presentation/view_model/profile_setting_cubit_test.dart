import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/contect_terms_use_case.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/content_about_us_use_case.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/get_user_data_use_case.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_cubit.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_event.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'profile_setting_cubit_test.mocks.dart';

@GenerateMocks([
  GetUserDataUseCase,
  GetTermsUseCase,
  GetAboutUsUseCase,
  SharedPrefHelper,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // 👈 ده يحل المشكلة

  late MockGetUserDataUseCase mockGetUserDataUseCase;
  late MockGetTermsUseCase mockGetTermsUseCase;
  late MockGetAboutUsUseCase mockGetAboutUsUseCase;
  late MockSharedPrefHelper mockSharedPrefHelper;

  late UserProfileEntity mockUserProfileEntity;
  late ApiSuccessResult<UserProfileEntity> successResult;
  late ApiErrorResult<UserProfileEntity> errorResult;

  setUp(() async {
    PackageInfo.setMockInitialValues(
      appName: 'Test App',
      packageName: 'com.example.test',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
    // reset getIt before every test
    await getIt.reset();
    // getIt.registerLazySingleton<SharedPrefHelper>(() => mockSharedPrefHelper);

    mockGetUserDataUseCase = MockGetUserDataUseCase();
    mockGetTermsUseCase = MockGetTermsUseCase();
    mockGetAboutUsUseCase = MockGetAboutUsUseCase();
    mockSharedPrefHelper = MockSharedPrefHelper();

    getIt.registerLazySingleton<SharedPrefHelper>(() => mockSharedPrefHelper);

    mockUserProfileEntity = UserProfileEntity(
      id: 'id',
      firstName: 'firstName',
      lastName: 'lastName',
      email: 'email',
      gender: 'gender',
      phone: 'phone',
      photo: 'photo',
      wishlist: [],
      addresses: [],
    );

    successResult = ApiSuccessResult<UserProfileEntity>(
      data: mockUserProfileEntity,
    );

    errorResult = ApiErrorResult<UserProfileEntity>(
      failure: Failure(errorMessage: "Network error"),
    );

    provideDummy<ApiResult<UserProfileEntity>>(successResult);
    provideDummy<ApiResult<UserProfileEntity>>(errorResult);
  });

  blocTest<ProfileSettingCubit, ProfileSettingState>(
    'emits [loading, success] when token saved and getUserData succeeds',
    build: () {
      when(
        mockSharedPrefHelper.getData(key: AppConstants.isTokenSaved),
      ).thenReturn(true);
      when(
        mockSharedPrefHelper.getData(key: Constants.enableNotification),
      ).thenReturn(false);
      when(mockGetAboutUsUseCase.call()).thenAnswer((_) async => []);
      when(mockGetTermsUseCase.call()).thenAnswer((_) async => []);
      when(
        mockSharedPrefHelper.getData(key: Constants.languageCode),
      ).thenReturn("en");
      when(
        mockGetUserDataUseCase.call(),
      ).thenAnswer((_) async => successResult);

      return ProfileSettingCubit(
        mockGetUserDataUseCase,
        mockGetTermsUseCase,
        mockGetAboutUsUseCase,
      );
    },
    act: (bloc) async => await bloc.doIntent(SumitProflieSettingEvent()),
    expect: () => contains(
      isA<ProfileSettingState>().having(
        (s) => s.userProfileEntity,
        'user',
        mockUserProfileEntity,
      ),
    ),

    verify: (_) {
      verify(mockGetUserDataUseCase.call()).called(1);
      verify(
        mockSharedPrefHelper.getData(key: AppConstants.isTokenSaved),
      ).called(1);
    },
  );

  blocTest<ProfileSettingCubit, ProfileSettingState>(
    'emits [loading, error] when token saved and getUserData fails',
    build: () {
      when(
        mockSharedPrefHelper.getData(key: AppConstants.isTokenSaved),
      ).thenReturn(true);
      when(
        mockSharedPrefHelper.getData(key: Constants.enableNotification),
      ).thenReturn(false);
      when(mockGetAboutUsUseCase.call()).thenAnswer((_) async => []);
      when(mockGetTermsUseCase.call()).thenAnswer((_) async => []);
      when(
        mockSharedPrefHelper.getData(key: Constants.languageCode),
      ).thenReturn("en");
      when(
        mockSharedPrefHelper.getData(key: AppConstants.isTokenSaved),
      ).thenReturn(true);
      when(mockGetUserDataUseCase.call()).thenAnswer((_) async => errorResult);

      return ProfileSettingCubit(
        mockGetUserDataUseCase,
        mockGetTermsUseCase,
        mockGetAboutUsUseCase,
      );
    },
    act: (bloc) => bloc.doIntent(SumitProflieSettingEvent()),
    expect: () => contains(
      isA<ProfileSettingState>().having(
        (s) => s.errorMessage,
        'errorMessage',
        'Network error',
      ),
    ),
  );
}
