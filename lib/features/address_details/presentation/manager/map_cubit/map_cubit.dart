import 'package:flowers_ecommerce_app/features/address_details/presentation/manager/map_cubit/map_event.dart';
import 'package:flowers_ecommerce_app/features/address_details/presentation/manager/map_cubit/map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../../../../../core/di/di.dart';
import '../add_new_address_cubit/add_new_address_cubit.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit(this.location) : super(const MapState());

  late GoogleMapController mapController;
  final Location location;

  doIntent(MapEvent event) {
    switch (event) {
      case RequestLocationPermissionEvent():
        return _requestLocationPermission();
      case CheckLocationServiceEvent():
        return _checkLocationService();
      case GetCurrentLocationEvent():
        return _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    if (!state.locationPermissionGranted) {
      return;
    }
    if (!state.locationServiceEnabled) {
      return;
    }

    LocationData locationData = await location.getLocation();
    final newCameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17,
    );
    final newMarkers = {
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
      ),
    };

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );

    emit(
      state.copyWith(cameraPosition: newCameraPosition, markers: newMarkers),
    );

    getIt<AddressDetailsCubit>().updateLatLong(
      locationData.latitude ?? 0,
      locationData.longitude ?? 0,
    );
  }

  Future<void> _requestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    final granted = permissionStatus == PermissionStatus.granted;
    emit(state.copyWith(locationPermissionGranted: granted));
  }

  Future<void> _checkLocationService() async {
    bool enabled = await location.serviceEnabled();
    if (!enabled) {
      enabled = await location.requestService();
    }
    emit(state.copyWith(locationServiceEnabled: enabled));
  }
}
