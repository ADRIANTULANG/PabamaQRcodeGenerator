import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:vector_math/vector_math.dart';

class LocationService extends GetxService {
  Location location = new Location();
  RxDouble userLatitude = 0.0.obs;
  RxDouble userLongitude = 0.0.obs;
  LatLng userCoordinates = LatLng(0.0, 0.0);
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  initializedFunction() async {
    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled != true) {
      serviceEnabled = await location.requestService();
      if (serviceEnabled != true) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    userLatitude.value = double.parse(locationData!.latitude.toString());
    userLongitude.value = double.parse(locationData!.longitude.toString());
    userCoordinates = LatLng(userLatitude.value, userLongitude.value);
    print("user latitude : ${userLatitude.value.toString()}");
    print("user longitude : ${userLongitude.value.toString()}");
    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(userLatitude.value, userLongitude.value);
    print("name : ${placemarks[0].name}");
    print("locality : ${placemarks[0].locality}");
    print("sublocality : ${placemarks[0].subLocality}");
    print("street : ${placemarks[0].street}");
    print("subThoroughfare : ${placemarks[0].subThoroughfare}");
    print("administrativeArea : ${placemarks[0].administrativeArea}");
    print("subAdministrativeArea : ${placemarks[0].subAdministrativeArea}");
    print("country : ${placemarks[0].country}");
  }

  Future<String> getAddress(
      {required double latitude, required double longitude}) async {
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(latitude, longitude);
    var address = "${placemarks[0].locality}" +
        " " +
        "${placemarks[0].administrativeArea}";
    return address;
  }

  getDistance({
    required double desLat,
    required double desLng,
    required double orLat,
    required double orLng,
  }) {
    double earthRadius = 6371000;
    // userLatitude.value, userLongitude.value
    var dLat = radians(desLat - orLat);
    var dLng = radians(desLng - orLng);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(radians(userLatitude.value)) *
            cos(radians(desLat)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var distanceInmeters = earthRadius * c;
    var distanceinKilometer = distanceInmeters / 1000;
    print(distanceinKilometer);
    return distanceinKilometer;
    //d is the distance in meters
  }
}
