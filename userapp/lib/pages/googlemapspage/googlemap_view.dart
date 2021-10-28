import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/pages/googlemapspage/googlemap_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends GetView<GoogleController> {
  const GoogleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GoogleController());
    return Scaffold(
      body: Obx(
        () => GoogleMap(
          mapType: MapType.normal,
          markers: Set<Marker>.of(controller.marker),
          initialCameraPosition: controller.kGooglePlex,
          onMapCreated: (GoogleMapController controllers) {
            if (controller.mapController.isCompleted) {
            } else {
              controller.mapController.complete(controllers);
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: controller.goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}
