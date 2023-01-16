import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:luminouskey_task/constants/sizes.dart';
import 'package:luminouskey_task/controllers/maps_provider.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  final LatLng doctorLatLng;

  const MapPage({
    super.key,
    required this.doctorLatLng,
  });

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> googleMapController = Completer();
    Location location = Location();

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: Sizes.width(context) / 2,
          height: Sizes.height(context) / 15,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Add Location',
              style: TextStyle(
                color: Colors.white,
          
                fontWeight: FontWeight.bold,
                fontSize: Sizes.allSize(context) / 60,
              ),
            ),
          ),
        ),
      ),
      body: Consumer<MapsProvider>(builder: (context, provider, child) {
        return Stack(
          children: [
            ///----Map
            GoogleMap(
              markers: provider.markers,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              mapToolbarEnabled: true,
              compassEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.normal,
              onTap: (LatLng latLng) {
                log('Tapped at: $latLng');
              },
              initialCameraPosition: provider.initCameraPosition(),
              buildingsEnabled: true,
              onMapCreated: (GoogleMapController controller) async {
                googleMapController.complete(controller);
                provider
                    .userLocation(context, googleMapController)
                    .then((currentLocation) {
                  provider.updateMarker(context, doctorLatLng);
                });

                ////////////////////////////
                ///update location localy///
                ////////////////////////////
                location.onLocationChanged.listen((l) async {
                  //listen to the user position

                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(l.latitude ?? 0, l.longitude ?? 0),
                      zoom: 15,
                    ),
                  );
                });

                ////////////////////////////
              },
            ),
          ],
        );
      }),
    );
  }
}
