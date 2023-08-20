import 'package:firstflutterproject/models/econo_app/profile_model.dart';

class EditeProfileModel{
  String? status;
  EditeData? data;

  EditeProfileModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
    data=EditeData.fromjson(json['data']);
  }
}

class EditeData {
  UserModel? user;

  EditeData.fromjson(Map<String,dynamic>json){
    user=UserModel.fromjson(json['user']);
  }
}