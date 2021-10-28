import 'dart:async';

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:userapp/pages/googlemapspage/googlemap_api.dart';
import 'package:userapp/pages/homepage/home_controller.dart';

class GoogleController extends GetxController {
  final box = GetStorage();
  Completer<GoogleMapController> mapController = Completer();
  RxList<Marker> marker = <Marker>[].obs;
  RxString busID = ''.obs;
  Timer? streamTimer;

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(8.486196499411589, 124.65046813372001),
    zoom: 14.4746,
  );

  CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  @override
  void onClose() {
    streamTimer!.cancel();
    Get.find<HomeController>().functionStream();
    print("google map timer cancel");
  }

  @override
  void onInit() async {
    super.onInit();
    busID.value = await Get.arguments['busID'];
    double lat = await Get.arguments['latitude'];
    double long = await Get.arguments['longitude'];
    marker.add(Marker(
      //add second marker
      markerId: MarkerId(busID.value.toString()),
      position: LatLng(lat, long), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    LatLng latlong = LatLng(lat, long);
    CameraPosition location =
        CameraPosition(target: latlong, zoom: 15.151926040649414);
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(location));
    googleMapStream();
  }

  googleMapStream() {
    streamTimer = Timer.periodic(Duration(seconds: 20), (timer) {
      getDataStreamLatlong();
    });
  }

  getDataStreamLatlong() async {
    var result = await GoogleMapApi.getBusCoordinates(busID: busID.value);
    LatLng coordinates = result;
    marker.clear();
    marker.add(Marker(
      //add second marker
      markerId: MarkerId(busID.value.toString()),
      position: coordinates, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    CameraPosition location =
        CameraPosition(target: coordinates, zoom: 15.151926040649414);
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(location));
  }
}
