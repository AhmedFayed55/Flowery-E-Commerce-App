import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/entity/email_verify_args.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/pages/email_verification_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/pages/reset_password.dart';
import 'package:flowers_ecommerce_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/pages/register_screen.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/presentation/pages/user_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/change_password/presentation/presentation/pages/reset_password_screen.dart';
import '../../features/main_layout/main_layout.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case AppRoutes.emailVerification:
        final args = settings.arguments as EmailVerifyArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.cubit,
            child: EmailVerificationScreen(email: args.email),
          ),
        );

      case AppRoutes.resetPassword:
        final args = settings.arguments as EmailVerifyArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.cubit,
            child: ResetPasswordScreen(email: args.email),
          ),
        );

      case AppRoutes.mainLayout:
        return MaterialPageRoute(builder: (context) => const MainLayout());

      case AppRoutes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      case AppRoutes.savedAddresses:
        return MaterialPageRoute(builder: (_) => const UserAddressesScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
