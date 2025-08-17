import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/repo/auth_repo.dart';

class RegisterUsecase {
  final AuthRepo authRepo;
  RegisterUsecase({required this.authRepo});

  Future<ApiResult<RegisterRespone>> invok(RegisterBody request) =>
      authRepo.register(request);
}
