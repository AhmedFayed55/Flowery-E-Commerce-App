import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:flowers_ecommerce_app/features/auth/login/presentation/view_model/login_event.dart';
import 'package:flowers_ecommerce_app/features/auth/login/presentation/view_model/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginState());

  void doIntent(LoginEvent event) {
    switch (event) {
      case SumitLoginEvent():
        return _login(event.loginRequestEntity, event.isRemember);
      case SumitAsGestEvent():
        return _loginAgest();
    }
  }

  void _login(LoginRequestEntity loginRequestEntity, bool isRemeber) async {
    emit(state.copyWith(isLoadding: true));
    var result = await _loginUseCase(loginRequestEntity);
    switch (result) {
      case ApiSuccessResult():
        _saveRememberMe(isRemeber);
        return emit(
          state.copyWith(
            isLoadding: false,
            userEntity: result.data,
            errorMessage: '',
          ),
        );
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            errorMessage: result.failure.errorMessage,
          ),
        );
    }
  }

  void _loginAgest() async {
    await getIt<TokenService>().deleteToken();
    emit(state.copyWith(userEntity: null));
  }

  Future<void> _saveRememberMe(bool isRemeber) async {
    await getIt<SharedPrefHelper>().saveData(
      key: Constants.isRemeber,
      val: isRemeber,
    );
  }
}
