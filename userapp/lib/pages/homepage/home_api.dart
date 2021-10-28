import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:userapp/helpers/endpoints.dart';
import 'package:userapp/pages/homepage/home_model.dart';

class HomeApi {
// Future<List<StoreDetailsModel>>
  static Future<List<Bus>> getBus({
    required String destination,
  }) async {
    try {
      var response;
      if (destination.isEmpty) {
        response = await http.post(
          Uri.parse("$endPoint/getBus-withOutDestination.php"),
          body: {},
        ).timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException("timeout");
        });
      } else {
        response = await http.post(
          Uri.parse("$endPoint/getBus-withDestination.php"),
          body: {
            "destination": destination.toString(),
          },
        ).timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException("timeout");
        });
      }
      // print('loginApi code ${response.statusCode}');
      // print('getBus body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return busFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBus catch error $error');
      return Future.error(true);
    }
  }

// Future<List<Bus>>
  static Future<List<History>> getHistory({
    required String customerid,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getHistory.php"),
        body: {
          "customerid": customerid,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return historyFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBus catch error $error');
      return Future.error(true);
    }
  }
}
