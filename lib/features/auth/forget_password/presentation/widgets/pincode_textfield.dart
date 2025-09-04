import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/entity/email_verify_args.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_event.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeTextField extends StatefulWidget {
  final ForgetPasswordCubit forgetPasswordCubit;
  final String email;

  const OtpCodeTextField({super.key, required this.forgetPasswordCubit,required this.email});

  @override
  State<OtpCodeTextField> createState() => _OtpCodeTextFieldState();
}

class _OtpCodeTextFieldState extends State<OtpCodeTextField> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state.isSuccessState) {
          Navigator.pushNamed(context, AppRoutes.resetPassword,arguments: EmailVerifyArgs(widget.forgetPasswordCubit, widget.email));
        }
      },
      builder: (context, state) {
        return Container(
          height: 100.h,
          alignment: Alignment.center,
          child: state.isLoadingState
              ? const Center(child: CircularProgressIndicator())
              : PinCodeTextField(
                  showCursor: true,
                  cursorColor: AppColors.pink,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldHeight: 68.h,
                    fieldWidth: 50.w,
                    borderWidth: 1,
                    activeFillColor: AppColors.white[60],
                    inactiveFillColor: AppColors.white[60],
                    activeColor: AppColors.white[60],
                    inactiveColor: AppColors.white[60],
                    selectedFillColor: AppColors.white[60],
                    selectedColor: AppColors.white[60],
                    errorBorderColor: AppColors.red,
                  ),
                  animationDuration: const Duration(milliseconds: 200),
                  enableActiveFill: true,
                  onCompleted: (code) {
                    widget.forgetPasswordCubit.doIntent(
                      GetEmailVerificationEvent(code: code),
                    );
                  },
                ),
        );
      },
    );
  }
}
