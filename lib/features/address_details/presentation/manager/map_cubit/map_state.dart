import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends Equatable {
  final bool locationPermissionGranted;
  final bool locationServiceEnabled;
  final CameraPosition cameraPosition;
  final Set<Marker> markers;

  const MapState({
    this.locationPermissionGranted = false,
    this.locationServiceEnabled = false,
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 14,
    ),
    this.markers = const {},
  });

  MapState copyWith({
    bool? locationPermissionGranted,
    bool? locationServiceEnabled,
    CameraPosition? cameraPosition,
    Set<Marker>? markers,
  }) {
    return MapState(
      locationPermissionGranted:
          locationPermissionGranted ?? this.locationPermissionGranted,
      locationServiceEnabled:
          locationServiceEnabled ?? this.locationServiceEnabled,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [
    locationPermissionGranted,
    locationServiceEnabled,
    cameraPosition,
    markers,
  ];
}
