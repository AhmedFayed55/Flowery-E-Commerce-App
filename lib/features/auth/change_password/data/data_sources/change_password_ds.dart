import '../models/request/change_password_request_dto.dart';
import '../models/response/change_password_response_dto.dart';

abstract interface class ChangePasswordDataSource {
  Future<ChangePasswordResponseDto> changePassword(
    ChangePasswordRequestDto request,
  );
}
