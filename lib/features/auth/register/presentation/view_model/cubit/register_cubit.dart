import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/usecase/register_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/view_model/cubit/registr_event.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUsecase registerUsecase;
  RegisterCubit(this.registerUsecase) : super(RegisterState());

  void doIntent(RegisterEvent event) {
    switch (event) {
      case RegisterSubmitEvent():
        _register(event.registerBody);
        break;
    }
  }

  Future<void> _register(RegisterBody registerBody) async {
    emit(state.copyWith(isLoading: true));
    final result = await registerUsecase.invok(registerBody);
    switch (result) {
      case ApiSuccessResult():
        emit(state.copyWith(isSuccess: true, isLoading: false));
        break;
      case ApiErrorResult():
        emit(
          state.copyWith(
            isSuccess: false,
            isFailure: true,
            errorMessage: result.failure.errorMessage,
            isLoading: false,
          ),
        );
        break;
    }
  }
}
