import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/products_dto_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/usecases/search_usecase.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_cubit_test.mocks.dart';

@GenerateMocks([SearchUseCase])
void main() {
  List<ProductsDtoEntity>? products;
  late String keyword;
  late String errorMessage;
  late String entityMessage;
  late MockSearchUseCase mockSearchUseCase;
  late SearchResponseEntity searchResponseEntity;
  late SearchCubit searchCubit;

  setUp(() {
    products = [
      ProductsDtoEntity(
        id: "1",
        title: "title-1",
        description: "description-1",
      ),
      ProductsDtoEntity(
        id: "2",
        title: "title-2",
        description: "description-2",
      ),
    ];
    keyword = "keyword";
    errorMessage = "Error";
    entityMessage = "Success";
    mockSearchUseCase = MockSearchUseCase();
    searchResponseEntity = SearchResponseEntity(
      message: entityMessage,
      productsDtoEntity: products,
    );
    searchCubit = SearchCubit(searchUseCase: mockSearchUseCase);
  });

  group("Test Cases emits for GoToSearchEvent", () {

    /// Success
    test(
      "Success Case emits ( loading + success + productsDtoEntity ) states for GoToSearchEvent",
      () async {
        ///Arrange

        var successResult = ApiSuccessResult<SearchResponseEntity>(
          data: searchResponseEntity,
        );
        provideDummy<ApiResult<SearchResponseEntity>>(successResult);

        when(
          mockSearchUseCase.call(keyword),
        ).thenAnswer((_) async => successResult);

        ///Act

        await searchCubit.doIntent(GoToSearchEvent(keyword: keyword));

        ///Assert
        expect(searchCubit.state.isLoading, false);
        expect(searchCubit.state.isSuccess, true);
        expect(searchCubit.state.productsDtoEntity, products);

        verify(mockSearchUseCase.call(keyword)).called(1);
      },
    );

    /// Error
    test(
      "Error case emits ( loading + error ) states for GoToSearchEvent",
      () async {
        var mocFailure = Failure(errorMessage: errorMessage);
        var errorResult = ApiErrorResult<SearchResponseEntity>(
          failure: mocFailure,
        );
        provideDummy<ApiResult<SearchResponseEntity>>(errorResult);

        when(
          mockSearchUseCase.call(keyword),
        ).thenAnswer((_) async => errorResult);

        await searchCubit.doIntent(GoToSearchEvent(keyword: keyword));

        expect(searchCubit.state.isLoading, false);
        expect(searchCubit.state.isSuccess, false);
        expect(searchCubit.state.isError, true);
        expect(searchCubit.state.errorMessage, equals(mocFailure.errorMessage));

        verify(mockSearchUseCase.call(keyword)).called(1);
      },
    );
  });
}
