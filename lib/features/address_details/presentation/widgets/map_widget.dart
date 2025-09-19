import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../manager/map_cubit/map_cubit.dart';
import '../manager/map_cubit/map_event.dart';
import '../manager/map_cubit/map_state.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170.h,
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                markers: state.markers,
                initialCameraPosition: state.cameraPosition,
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  context.read<MapCubit>().mapController = controller;
                },
              ),
              Positioned(
                right: 11.w,
                top: 11.h,
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.gps_fixed_sharp,
                    color: AppColors.pink,
                    size: 25.sp,
                  ),
                  onPressed: () {
                    context.read<MapCubit>().doIntent(
                      GetCurrentLocationEvent(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
