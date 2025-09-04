import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart';

class EmailVerifyArgs {
  final ForgetPasswordCubit cubit;
  final String email;

  EmailVerifyArgs(this.cubit, this.email);
}
