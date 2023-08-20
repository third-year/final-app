
import 'dart:convert';

import 'package:firstflutterproject/modules/login/login_controller.dart';

// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));
//
// String loginModelToJson(LoginModel data) => json.encode(
//       data.toJson(
//         LoginModel(email: '', password: ''),
//       ),
//     );

class LoginModel {
  LoginModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;


  Future login() async{
    LoginController loginController = LoginController();
    var user = {
      'email': email,
      'password': password
    };
    loginController.login(user);



  }
  //
  // factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
  //       email: json['email'],
  //       password: json['password'],
  //     );
  //
  // Map<String, dynamic> toJson(LoginModel log) {
  //   return {
  //     "email": log.email,
  //     "password": log.password,
  //   };
  // }
}
