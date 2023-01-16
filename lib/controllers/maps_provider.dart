import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsProvider with ChangeNotifier {
  final Location _location = Location();
  LocationData currentLocation = LocationData.fromMap({});
  Set<Marker> markers = <Marker>{};

  /////////////////////////////
  ///Initial Camera Position///
  /////////////////////////////
  CameraPosition initCameraPosition() {
    CameraPosition initPosition = const CameraPosition(
      target: LatLng(31.98856144579996, 35.84990914911032),
      zoom: 8.4746,
    );
    return initPosition;
  }

  ////////////////////////////////////
  //////Go to the Branch Marker///////
  ////////////////////////////////////
  Future<void> goToTheBranch(
      LatLng latLng, Completer<GoogleMapController> googleMapController) async {
    final GoogleMapController controller = await googleMapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 192.8334901395799,
          target: latLng,
          tilt: 59.440717697143555,
          zoom: 19.151926040649414,
        ),
      ),
    );
  }

  /////////////////////////////
  /////All Markers In Map//////
  /////////////////////////////
  void updateMarker(BuildContext context, LatLng newLocalData) {
    // LatLng latlng =
    //     LatLng(newLocalData.latitude ?? 0, newLocalData.longitude ?? 0);

    markers.add(
      Marker(
        markerId: const MarkerId("User_Marker"),
        position: newLocalData,
        rotation: 0,
        draggable: false,
        flat: true,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    notifyListeners();
  }

  //////////////////////
  ///Current Location///
  //////////////////////
  Future<LocationData> userLocation(BuildContext context,
      Completer<GoogleMapController> googleMapController) async {
    final GoogleMapController controller = await googleMapController.future;

    try {
      currentLocation = await _location.getLocation();
    } on Exception {
      log(currentLocation.toString());
    }

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude ?? 0.0,
              currentLocation.longitude ?? 0.0),
          zoom: 10,
        ),
      ),
    );

    return currentLocation;
  }

  // /////////////////////////////
  // /////All Markers In Map//////
  // /////////////////////////////
  // void updateMarker(BuildContext context, LocationData newLocalData) {
  //   LatLng latlng =
  //       LatLng(newLocalData.latitude ?? 0, newLocalData.longitude ?? 0);

  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId("User_Marker"),
  //       position: latlng,
  //       rotation: 0,
  //       draggable: false,
  //       flat: true,
  //       anchor: const Offset(0.5, 0.5),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ),
  //   );
  //   notifyListeners();
  // }
}
