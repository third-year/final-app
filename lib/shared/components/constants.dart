import 'package:firstflutterproject/shared/network/local/cache_helper.dart';

void printfulltext(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

dynamic token = CacheHelper.gettoken(key: 'token');
dynamic password1 = CacheHelper.gettoken(key: 'password');
