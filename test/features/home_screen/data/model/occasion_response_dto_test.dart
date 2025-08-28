import 'package:flowers_ecommerce_app/features/home_screen/data/model/occasion_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/occasion_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
test('when calltoDomain from occasionResponceDto is should return occasinEntity', (){
OccasionResponseDto mockOccasionResponceDto=const OccasionResponseDto(id: 'id',name: 'name',image: 'image');
OccasionEntity mockOccasionEntity=const OccasionEntity('id', 'name', 'image');
var result=mockOccasionResponceDto.toDomain();
expect(result, equals(mockOccasionEntity));
});
}