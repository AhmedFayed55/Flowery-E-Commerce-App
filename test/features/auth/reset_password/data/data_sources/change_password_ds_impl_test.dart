import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/data_sources/change_password_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/request/change_password_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/response/change_password_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../login/data/repositories/login_repo_imp_test.mocks.dart';
import '../../../register/data/source/auth_remote_data_sourse_imlp_test.mocks.dart';

@GenerateMocks([ApiServices,TokenService])
void main() {

  final ApiServices apiServices = MockApiServices();
  final TokenService tokenService = MockTokenService();

  final ChangePasswordDataSourceImpl dataSourceImpl = ChangePasswordDataSourceImpl(apiServices,tokenService);

  test('verify when call changePassword it should call changePassword from ApiServices', () async{

    final ChangePasswordRequestDto requestDto = ChangePasswordRequestDto(newPassword: "12",password: "1");
    const String token = "abskjn";
    
    final expectedResponse = ChangePasswordResponseDto(
      token: "dfsd",message: "asfas"
    );

    when(tokenService.getToken()).thenAnswer((_) async => token);
    when(apiServices.changePassword(requestDto, "${AppConstants.bearer} $token"))
        .thenAnswer((_) async => expectedResponse);

    var result = await dataSourceImpl.changePassword(requestDto);

    verify(tokenService.getToken()).called(1);
    verify(apiServices.changePassword(requestDto, "${AppConstants.bearer} $token")).called(1);
    expect(result, isA<ChangePasswordResponseDto>());

  });
}