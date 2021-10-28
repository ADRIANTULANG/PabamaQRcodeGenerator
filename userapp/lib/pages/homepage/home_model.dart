// To parse this JSON data, do
//
//     final bus = busFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Bus> busFromJson(String str) =>
    List<Bus>.from(json.decode(str).map((x) => Bus.fromJson(x)));

String busToJson(List<Bus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bus {
  Bus({
    required this.busId,
    required this.busName,
    required this.busDriverName,
    required this.busImage,
    required this.xLatitude,
    required this.xLongitude,
    required this.currentAddressLocation,
    required this.origin,
    required this.destination,
  });

  String busId;
  String busName;
  String busDriverName;
  String busImage;
  String xLatitude;
  String xLongitude;
  RxString currentAddressLocation;
  String origin;
  String destination;

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        busId: json["busID"],
        busName: json["busName"],
        busDriverName: json["busDriverName"],
        busImage: json["busImage"],
        xLatitude: json["xLatitude"],
        xLongitude: json["xLongitude"],
        currentAddressLocation: json["currentAddressLocation"].toString().obs,
        origin: json["origin"],
        destination: json["destination"],
      );

  Map<String, dynamic> toJson() => {
        "busID": busId,
        "busName": busName,
        "busDriverName": busDriverName,
        "busImage": busImage,
        "xLatitude": xLatitude,
        "xLongitude": xLongitude,
        "currentAddressLocation": currentAddressLocation,
        "origin": origin,
        "destination": destination,
      };
}

// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
    required this.transactionId,
    required this.pickup,
    required this.dropout,
    required this.customername,
    required this.customerid,
    required this.busid,
    required this.busname,
    required this.fare,
    required this.status,
  });

  String transactionId;
  String pickup;
  String dropout;
  String customername;
  String customerid;
  String busid;
  String busname;
  String fare;
  String status;

  factory History.fromJson(Map<String, dynamic> json) => History(
        transactionId: json["transactionID"],
        pickup: json["pickup"],
        dropout: json["dropout"],
        customername: json["customername"],
        customerid: json["customerid"],
        busid: json["busid"],
        busname: json["busname"],
        fare: json["fare"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "transactionID": transactionId,
        "pickup": pickup,
        "dropout": dropout,
        "customername": customername,
        "customerid": customerid,
        "busid": busid,
        "busname": busname,
        "fare": fare,
        "status": status,
      };
}
