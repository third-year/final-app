import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login_service.dart';

class LoginController {
  Future<String> login(dynamic user) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user.toJson(user),
    );

    //print(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
