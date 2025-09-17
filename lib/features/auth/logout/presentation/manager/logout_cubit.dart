import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/use_cases/logout_use_case.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_event.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/api_results.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.useCase) : super(const LogoutState());
  LogoutUseCase useCase;

  doIntent(LogoutEvent event) {
    switch (event) {
      case SubmitLogoutEvent():
        _logout();
        break;
    }
  }

  Future<void> _logout() async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMsg: null));

    var result = await useCase.invoke();

    switch (result) {
      case ApiSuccessResult<LogoutResponseEntity>():
        emit(state.copyWith(isLoading: false, isSuccess: true));
        break;
      case ApiErrorResult<LogoutResponseEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            errorMsg: result.failure.errorMessage,
          ),
        );
    }
  }
}
