import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:userapp/helpers/endpoints.dart';
// import 'package:userapp/pages/homepage/home_model.dart';

class GoogleMapApi {
// Future<List<StoreDetailsModel>>
  static Future<LatLng> getBusCoordinates({
    required String busID,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getBusCoordinates.php"),
        body: {"busID": busID.toString()},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getBusCoordinates code ${response.statusCode}');
      // print('getBusCoordinates body ${response.body}');
      print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        LatLng result = LatLng(
            double.parse(json.decode(response.body)[0]['xLatitude'].toString()),
            double.parse(
                json.decode(response.body)[0]['xLongitude'].toString()));
        return result;
        // return busFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBusCoordinates catch error $error');
      return Future.error(true);
    }
  }
}
