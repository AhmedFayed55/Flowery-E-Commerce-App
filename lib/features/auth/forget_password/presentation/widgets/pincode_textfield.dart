import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeTextField extends StatefulWidget {
  const OtpCodeTextField({super.key});

  @override
  State<OtpCodeTextField> createState() => _OtpCodeTextFieldState();
}

class _OtpCodeTextFieldState extends State<OtpCodeTextField> {
  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: (value) {
        /// validate otp code
        return null;
      },
      cursorColor: AppColors.pink,
      appContext: context,
      length: 4,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.slide,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10.r),
        fieldHeight: 68.h,
        fieldWidth: 74.w,
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
        otpCode = code;
        /// if otp code is correct will Navigate to reset password screen
      },
    );
  }
}
