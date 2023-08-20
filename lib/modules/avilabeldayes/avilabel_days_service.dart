import 'dart:convert';

AvilabelDaysModel AvilabelDaysModelFromJson(String str) =>
    AvilabelDaysModel.fromJson(json.decode(str));

String AvilabelDaysModelToJson(AvilabelDaysModel data) => json.encode(
  data.toJson(
    AvilabelDaysModel(email: '', password: ''),
  ),
);

class AvilabelDaysModel {
  AvilabelDaysModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory AvilabelDaysModel.fromJson(Map<String, dynamic> json) => AvilabelDaysModel(
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson(AvilabelDaysModel log) {
    return {
      "email": log.email,
      "password": log.password,
    };
  }
}
