import 'package:flowers_ecommerce_app/features/track_order/data/data_source/track_order_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/track_order/domain/repo/track_order_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackOrderRepo)
class TrackOrderRepoImp implements TrackOrderRepo {
  final TrackOrderRemoteDataSource _trackOrderRemoteDataSource;
  TrackOrderRepoImp(this._trackOrderRemoteDataSource);
}
