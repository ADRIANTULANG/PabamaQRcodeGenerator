import 'dart:async';
import 'dart:convert';
// import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:userapp/helpers/endpoints.dart';

class QRcodeApi {
// Future<List<StoreDetailsModel>>
  static addTransaction({
    required String pickup,
    required String dropout,
    required String customername,
    required String customerid,
    required String busid,
    required String busname,
    required String fare,
    required String seatno,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/addTransaction.php"),
        body: {
          "pickup": pickup.toString(),
          "dropout": dropout.toString(),
          "customername": customername.toString(),
          "customerid": customerid.toString(),
          "busid": busid.toString(),
          "busname": busname.toString(),
          "fare": fare.toString(),
          "seatnumber": seatno.toString()
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('getStoreDetails code ${response.statusCode}');
      // print('addTransaction body ${response.body}');
      // print(json.encode(json.decode(response.body)['data']));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)[0]['transacationID'];
        return result.toString();
        // return storeScheduleModelFromJson(
        //     json.encode(json.decode(response.body)['data']));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getStroeSchedule $error');
      return Future.error(true);
    }
  }

  static updateSeat(
      {required String busid,
      required String seatno,
      required String pickup}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/updateStatusToReserved.php"),
        body: {
          "busid": busid.toString(),
          "seatNumber": seatno.toString(),
          "pickup": pickup.toString()
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('updateSeat code ${response.statusCode}');
      // print('updateSeat body ${response.body}');
      // print(json.encode(json.decode(response.body)['data']));
      if (response.statusCode == 200) {
        // var result = jsonDecode(response.body)[0]['transacationID'];
        // return result.toString();
        // return storeScheduleModelFromJson(
        //     json.encode(json.decode(response.body)['data']));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('updateSeat $error');
      return Future.error(true);
    }
  }
}
