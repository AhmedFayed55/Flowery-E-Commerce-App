import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ApiResult", () {
    test('ApiSuccessResult should hold data correctly', () {
      var response = "Hello";
      
      var result = ApiSuccessResult<String>(data: response);
      
      expect(result.data, equals(response));
    });

    test('ApiErrorResult should hold Failure correctly', () {

      var response = Failure(errorMessage: "Network error");
      
      var result = ApiErrorResult<String>(failure: response);
      
      expect(result.failure.errorMessage, equals(response.errorMessage));
    });

    test('ApiResult should be one of success or error', () {
      var successResponse = ApiSuccessResult<int>(data: 200);
      var errorResponse = ApiErrorResult<int>(failure: Failure(errorMessage: "wrong"));

      expect(successResponse, isA<ApiSuccessResult<int>>());
      expect(errorResponse, isA<ApiErrorResult<int>>());
    });
  });
}
