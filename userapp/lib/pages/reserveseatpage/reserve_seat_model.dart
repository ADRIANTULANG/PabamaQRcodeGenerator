// To parse this JSON data, do
//
//     final terminals = terminalsFromJson(jsonString);

import 'dart:convert';

List<Terminals> terminalsFromJson(String str) =>
    List<Terminals>.from(json.decode(str).map((x) => Terminals.fromJson(x)));

String terminalsToJson(List<Terminals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Terminals {
  Terminals({
    required this.terminalId,
    required this.terminalName,
    required this.xLatitude,
    required this.xLongitude,
  });

  String terminalId;
  String terminalName;
  String xLatitude;
  String xLongitude;

  factory Terminals.fromJson(Map<String, dynamic> json) => Terminals(
        terminalId: json["TerminalID"],
        terminalName: json["TerminalName"],
        xLatitude: json["xLatitude"],
        xLongitude: json["xLongitude"],
      );

  Map<String, dynamic> toJson() => {
        "TerminalID": terminalId,
        "TerminalName": terminalName,
        "xLatitude": xLatitude,
        "xLongitude": xLongitude,
      };
}

// To parse this JSON data, do
//
//     final seats = seatsFromJson(jsonString);

List<Seats> seatsFromJson(String str) =>
    List<Seats>.from(json.decode(str).map((x) => Seats.fromJson(x)));

String seatsToJson(List<Seats> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Seats {
  Seats({
    required this.seatId,
    required this.busId,
    required this.seatNumber,
    required this.seatStatus,
  });

  String seatId;
  String busId;
  String seatNumber;
  String seatStatus;

  factory Seats.fromJson(Map<String, dynamic> json) => Seats(
        seatId: json["seatID"],
        busId: json["busID"],
        seatNumber: json["seatNumber"],
        seatStatus: json["seatStatus"],
      );

  Map<String, dynamic> toJson() => {
        "seatID": seatId,
        "busID": busId,
        "seatNumber": seatNumber,
        "seatStatus": seatStatus,
      };
}
