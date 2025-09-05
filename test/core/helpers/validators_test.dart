import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Name Validation Test", () {
    test("when empty should return error", () {
      expect(Validations.validateName(""), "Name is required!");
    });

    test("when invalid should return error", () {
      expect(Validations.validateName("A"), "This Name is not valid");
    });

    test("when valid should return null", () {
      expect(Validations.validateName("Ahmed"), null);
    });
  });

  group("Email Validation Test", () {
    test("when empty should return error", () {
      expect(Validations.validateEmail(""), "Email is required!");
    });

    test("when invalid should return error", () {
      expect(
        Validations.validateEmail("ahmedfayed.com"),
        "This Email is not valid",
      );
    });

    test("when valid should return null", () {
      expect(Validations.validateEmail("ahmedfayed@gmail.com"), null);
    });
  });

  group("Password Validation Test", () {
    test("when empty should return error", () {
      expect(Validations.validatePassword(""), "Password is required!");
    });

    test("when invalid should return error", () {
      expect(
        Validations.validatePassword("123456"),
        "This Password is not valid",
      );
    });

    test("when valid should return null", () {
      expect(Validations.validatePassword("A7medfayed@5"), null);
    });
  });

  group("Phone number Validation", () {
    test("when empty should return error", () {
      expect(Validations.validatePhoneNumber(""), "Phone number is required!");
    });

    test("when invalid should return error", () {
      expect(
        Validations.validatePhoneNumber("0115916"),
        "This Phone number is not valid",
      );
    });

    test("when valid should return error", () {
      expect(Validations.validatePhoneNumber("01096640218"), null);
    });
  });

  group("Confirm password Validation", () {
    const String password = "A7medfayed@5";

    test("when empty should return error", () {
      expect(
        Validations.validateConfirmPassword(password, ""),
        "Confirm Password is required!",
      );
    });

    test("when invalid should return error", () {
      expect(
        Validations.validateConfirmPassword(password, "12354341"),
        "This Confirm Password is not valid",
      );
    });

    test("when not match should return error", () {
      expect(
        Validations.validateConfirmPassword(password, "A7medfayd@5"),
        "Password and Confirm Password must be same!",
      );
    });

    test("when valid should return error", () {
      expect(
        Validations.validateConfirmPassword(password, "A7medfayed@5"),
        null,
      );
    });
  });
}
