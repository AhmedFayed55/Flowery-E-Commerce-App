import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/usecase/register_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUsecase registerUsecase;
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  Future<void> register(RegisterBody registerBody) async {
    emit(RegisterLoading());
    final result = await registerUsecase.invok(registerBody);
    switch (result) {
      case ApiSuccessResult():
        emit(RegisterSuccess());
        break;
      case ApiErrorResult():
        emit(RegisterFailure(errorMessage: result.failure.errorMessage));
        break;
    }
  }
}
