import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/track_order/data/data_source/track_order_remote_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackOrderRemoteDataSource)
class TrackOrderRemoteDataSourceImp implements TrackOrderRemoteDataSource {
  final ApiServices _apiServices;
  TrackOrderRemoteDataSourceImp(this._apiServices);
}
