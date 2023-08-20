// import 'package:new_lessons/config/server_config.dart';
// import 'package:new_lessons/models/user.dart';
// import 'package:http/http.dart' as http;
//
// class SplashService {
//   var message;
//
//   var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.check_valid);
//
//   Future<bool> checkValid(String token) async {
//     var response = await http.get(
//       url,
//       headers: {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );
//
//     print(response.statusCode);
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       return true;
//     } else if (response.statusCode == 401) {
//       message = 'you need to login';
//       return false;
//     } else {
//       message = 'server error';
//       return false;
//     }
//   }
// }
