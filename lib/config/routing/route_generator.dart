import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/entity/email_verify_args.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/pages/email_verification_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/pages/reset_password.dart';
import 'package:flowers_ecommerce_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/pages/register_screen.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/pages/home_screen.dart';
import 'package:flowers_ecommerce_app/features/most_selling/presentation/pages/most_selling_page.dart';
import 'package:flowers_ecommerce_app/features/notification/presentation/page/notification_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/about_us_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/terms_screen.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/pages/checkout_page.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/page/success_screen.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/page/webvieww_screen.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/pages/edit_profile_screen.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/pages/categories_screen.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/pages/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/best_saller_entity.dart';

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

      case AppRoutes.categories:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());

      case AppRoutes.emailVerification:
        final args = settings.arguments as EmailVerifyArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.cubit,
            child: EmailVerificationScreen(email: args.email),
          ),
        );
        case AppRoutes.mostSelling:
        var args = settings.arguments as List<BestSallerEntity>;
        return MaterialPageRoute(
          builder: (context) => MostSellingPage(products: args),
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
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
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


      case AppRoutes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case AppRoutes.successPayment:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
      case AppRoutes.webView:
        final url = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => WebviewScreen(url: url));
        
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (context) =>  const CartPage());

      case AppRoutes.checkout:
      var arg=settings.arguments as UserCart;
        return MaterialPageRoute(builder: (_) => CheckoutPage(userCart: arg,));
      case AppRoutes.editProfile:
      final arge=settings.arguments as UserProfileEntity;
        return MaterialPageRoute(builder: (context) =>   EditProfileScreen(userEntity: arge,));

      case AppRoutes.orders:
        return MaterialPageRoute(builder: (_) =>  OrdersPage());

      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

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

