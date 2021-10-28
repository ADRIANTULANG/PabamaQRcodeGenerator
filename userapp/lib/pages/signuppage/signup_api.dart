import 'dart:async';
// import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:userapp/helpers/endpoints.dart';

class SignUpApi {
// Future<List<StoreDetailsModel>>
  static addUserApi(
      {required String fullname,
      required String username,
      required String password,
      required String contactnumber}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/addUsers.php"),
        body: {
          "fullname": fullname.toString(),
          "username": username.toString(),
          "password": password.toString(),
          "contactnumber": contactnumber.toString()
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('getStoreDetails code ${response.statusCode}');
      // print('getStoreDetails body ${response.body}');
      // print(json.encode(json.decode(response.body)['data']));
      if (response.statusCode == 200) {
        return true;
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
}
