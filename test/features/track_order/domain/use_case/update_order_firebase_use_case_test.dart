import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/errors/firebase_results.dart';
import 'package:flowers_ecommerce_app/core/utils/enums.dart';
import 'package:flowers_ecommerce_app/features/track_order/domain/repo/track_order_repo.dart';
import 'package:flowers_ecommerce_app/features/track_order/domain/use_case/update_order_firebase_use_case.dart';

import 'update_order_firebase_use_case_test.mocks.dart';

@GenerateMocks([TrackOrderRepo])
void main() {
  group('UpdateOrderFirebaseUseCase', () {
    late MockTrackOrderRepo mockRepo;
    late UpdateOrderFirebaseUseCase usecase;

    const orderId = 'order_123';
    const status = RiderOrderStatus.delivered;

    setUp(() {
      mockRepo = MockTrackOrderRepo();
      usecase = UpdateOrderFirebaseUseCase(mockRepo);
    });

    provideDummy<FirebaseResult>(FirebaseSuccessResult(data: null));

    test(
      'when calling invoke with valid data should return FirebaseSuccessResult',
      () async {
        final expected = FirebaseSuccessResult(data: null);
        when(
          mockRepo.updateOrderStatusFirebase(orderId, status),
        ).thenAnswer((_) async => expected);

        final result = await usecase.invoke(orderId, status);

        verify(mockRepo.updateOrderStatusFirebase(orderId, status)).called(1);
        expect(result, isA<FirebaseSuccessResult>());
      },
    );

    test(
      'when calling invoke and repo returns FirebaseErrorResult should return FirebaseErrorResult',
      () async {
        final expected = FirebaseErrorResult(
          failure: Failure(errorMessage: 'Update failed'),
        );

        provideDummy<FirebaseErrorResult>(expected);
        when(
          mockRepo.updateOrderStatusFirebase(orderId, status),
        ).thenAnswer((_) async => expected);

        final result = await usecase.invoke(orderId, status);

        verify(mockRepo.updateOrderStatusFirebase(orderId, status)).called(1);
        expect(result, isA<FirebaseErrorResult>());
        expect(
          (result as FirebaseErrorResult).failure.errorMessage,
          equals('Update failed'),
        );
      },
    );
  });
}
