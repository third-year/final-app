import 'dart:convert';

SignupModel SignupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String SignupModelToJson(SignupModel data) => json.encode(
  data.toJson(
    SignupModel(name:'',email: '', password: '',username:'',country:'',city:'',phonenumber:1,isuser:true),
  ),
);

class SignupModel {
  SignupModel({
    required this.name,
    required this.email,
    required this.password,
    required this.username,
    required this.country,
    required this.city,
    required this.phonenumber,
    required this.isuser,
  });
  final String name;
  final String email;
  final String password;
  final String username;
  final String country;
  final String city;
  final int phonenumber;
  final bool isuser;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    name: json['name'],
    email: json['email'],
    password: json['password'],
    username: json['username'],
    country: json['country'],
    city: json['city'],
    phonenumber: json['phonenumber'],
    isuser: json['isuser'],
  );

  Map<String, dynamic> toJson(SignupModel log) {
    return {
      "name":log.name,
      "email": log.email,
      "password": log.password,
      "username":log.username,
      "country": log.country,
      "city": log.city,
      "phonenumber":log.phonenumber,
      "isuser": log.isuser,
    };
  }
}