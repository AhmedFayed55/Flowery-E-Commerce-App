import 'package:flowers_ecommerce_app/core/helpers/regex.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';

abstract class Validations {
  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return 'Name is required!';
    } else if (!AppRegExp.isNameValid(name)) {
      return 'This Name is not valid';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email is required!';
    } else if (!AppRegExp.isEmailValid(email)) {
      return 'This Email is not valid';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Password is required!';
    } else if (!AppRegExp.isPasswordValid(password)) {
      return 'This Password is not valid';
    }
    return null;
  }

  static String? confirmPassword(
    BuildContext context,
    String? newPassword, [
    String? confirmPassword,
  ]) {
    if (newPassword == null || newPassword.isEmpty) {
      return AppLocalizations.of(context)!.password_is_required;
    } else if (newPassword.length < 6) {
      return AppLocalizations.of(
        context,
      )!.password_must_be_at_least_6_characters;
    } else if (confirmPassword != null && newPassword != confirmPassword) {
      return AppLocalizations.of(context)!.passwords_do_not_match;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword!.isEmpty) {
      return 'Confirm Password is required!';
    } else if (!AppRegExp.isPasswordValid(confirmPassword)) {
      return 'This Confirm Password is not valid';
    } else if (password != confirmPassword) {
      return 'Password and Confirm Password must be same!';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber!.isEmpty) {
      return 'Phone number is required!';
    } else if (!AppRegExp.isPhoneNumberValid(phoneNumber)) {
      return 'This Phone number is not valid';
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
