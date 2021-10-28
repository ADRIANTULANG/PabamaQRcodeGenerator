// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.userid,
    required this.fullname,
    required this.username,
    required this.password,
    required this.contactnumber,
  });

  String userid;
  String fullname;
  String username;
  String password;
  String contactnumber;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userid: json["userid"],
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
        contactnumber: json["contactnumber"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "fullname": fullname,
        "username": username,
        "password": password,
        "contactnumber": contactnumber,
      };
}
