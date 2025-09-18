abstract class ApiConstants {
  static const String baseUrl = "https://flower.elevateegy.com/api/v1/";
  static const String authorization = "Authorization";
  static const String loginEndpoint = "auth/signin";
  static const String registerEndpoint = "auth/signup";
  static const String forgetPasswordEndpoint = "auth/forgotPassword";
  static const String verifyResetCode = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String userData = 'auth/profile-data';
  static const String homeEndpoint = 'home';
  static const String changePassword = "auth/change-password";
  static const String paymendCard = "orders/checkout?url=http://localhost:3000";
  static const String paymentCash = "orders";
  static const String orders = "orders";
  static const String address = "addresses";
  static const String deleteOrGetSavedAddress = "addresses";
  static const String logout = "auth/logout";
  static const String ocassion = "Ocassion";
  static const String getSpecificOccasion = "products";
  static const String cart = "cart";
  static const String cartUD = "cart/{id}";
  static const String search = "products";
  static const String addresses = "addresses";
}
