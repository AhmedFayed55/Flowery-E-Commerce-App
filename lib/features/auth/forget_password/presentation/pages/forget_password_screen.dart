import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.password)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  verticalSpace(40),
                  Text(
                    AppLocalizations.of(context)!.forget_password,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  verticalSpace(16),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.please_enter_your_email_associated_to_your_account,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  verticalSpace(32),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      return Validations.validateEmail(email);
                    },
                    decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)!.email),
                      hintText: AppLocalizations.of(context)!.enter_your_email,
                    ),
                  ),
                  verticalSpace(48),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, AppRoutes.emailVerification);
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.confirm),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
