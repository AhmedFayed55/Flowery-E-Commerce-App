
import '../model/home_response_dto.dart';

abstract class HomeDataSource {
  Future<HomeResponseDto> homeDataSource();
}
