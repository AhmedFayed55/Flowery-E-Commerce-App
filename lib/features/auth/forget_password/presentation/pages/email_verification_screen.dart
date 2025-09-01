import 'dart:async';

import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_event.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_state.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/widgets/pincode_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;

  const EmailVerificationScreen({super.key, required this.email});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  late int _seconds;
  late bool isResend;
  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.password),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpace(40),
                    Text(
                      AppLocalizations.of(context)!.email_verification,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    verticalSpace(16),
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.please_enter_your_code_that_send_to_your_email_address,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    verticalSpace(32),
                    OtpCodeTextField(
                      forgetPasswordCubit: forgetPasswordCubit,
                      email: widget.email,
                    ),
                    Text(
                      "00 : ${_seconds.toString().padLeft(2, '0')}",
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(color: AppColors.darkGrey),
                    ),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.didnot_receive_code,
                          style: Theme.of(
                            context,
                          ).textTheme.displaySmall?.copyWith(fontSize: 16.sp),
                        ),
                        InkWell(
                          onTap: isResend
                              ? () {
                                  _startTimer();
                                  forgetPasswordCubit.doIntent(
                                    GetIsResendOtpEvent(
                                      email: widget.email,
                                    ),
                                  );
                                }
                              : null,
                          child: Text(
                            AppLocalizations.of(context)!.resend,
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  color: isResend
                                      ? AppColors.pink
                                      : AppColors.darkGrey,
                                  decoration: isResend
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationColor: isResend
                                      ? AppColors.pink
                                      : AppColors.darkGrey,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _startTimer() {
    _seconds = 30;
    isResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 1) {
        setState(() {
          _seconds--;
        });
      } else {
        setState(() {
          _seconds = 0;
          isResend = true;
        });
        timer.cancel();
      }
    });
  }
}
