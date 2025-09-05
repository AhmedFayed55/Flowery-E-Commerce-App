import 'package:flowers_ecommerce_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/pages/register_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/about_us_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/terms_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/forget_password/presentation/pages/forget_password_screen.dart';
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

      case AppRoutes.mainLayout:
        return MaterialPageRoute(builder: (context) => const MainLayout());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileSettingScreen());
      case AppRoutes.terms:
        final termsList = settings.arguments as List<TermEntity>? ?? [];
        return MaterialPageRoute(
          builder: (_) => TermsScreen(termsList: termsList),
        );
      case AppRoutes.aboutUs:
        final aboutUsList = settings.arguments as List<AboutUsEntity>? ?? [];
        return MaterialPageRoute(
          builder: (_) => AboutUsScreen(aboutUsList: aboutUsList),
        );

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
