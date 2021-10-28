import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:userapp/helpers/endpoints.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_model.dart';

class ReserveSeatApi {
// Future<List<StoreDetailsModel>>
  static Future<List<Terminals>> getTerminal() async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getTerminals.php"),
        body: {},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('loginApi code ${response.statusCode}');
      // print('getBus body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return terminalsFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBus catch error $error');
      return Future.error(true);
    }
  }

// Future<List<Terminals>>
  static Future<List<Seats>> getSeats({required String busid}) async {
    print(busid);
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getSeats.php"),
        body: {'busid': busid.toString()},
      ).timeout(const Duration(seconds: 50), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('loginApi code ${response.statusCode}');
      // print('getBus body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return seatsFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBus catch error $error');
      return Future.error(true);
    }
  }
}
