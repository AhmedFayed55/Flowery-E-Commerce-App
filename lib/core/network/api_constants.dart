abstract class ApiConstants {
  static const String baseUrl = "https://flower.elevateegy.com/api/v1/";
  static const String authorization = "Authorization";
  static const String loginEndpoint = "auth/signin";
  static const String registerEndpoint = "auth/signup";
  static const String forgetPasswordEndpoint = "auth/forgotPassword";
  static const String verifyResetCode = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String homeEndpoint = 'home';
  static const String userData = 'auth/profile-data';
  static const String editProfile = "auth/editProfile";
  static const String uploadPhoto = "auth/upload-photo";
  static const String changePassword = "auth/change-password";
  static const String cart = "cart";
  static const String cartUD = "cart/{id}";
  
  static const String addresses = "addresses";

  static const String paymendCard = "orders/checkout?url=http://localhost:3000";
  static const String paymentCash = "orders";
}
