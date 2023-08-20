class ProfileModel{
  dynamic? satuts;
  UserModel? user;

  ProfileModel.fromjson(Map<String,dynamic>json){
    satuts=json['satuts'];
    user=UserModel.fromjson(json['user']);
  }
}
class UserModel{
  dynamic? id;
  String?fullName;
  String?email;
  String?image;
  String?roles;
  dynamic?phone;
  dynamic?wallet;
  int?v;

  UserModel.fromjson(Map<String,dynamic>json){
    id=json['_id'];
    fullName=json['fullName'];
    email=json['email'];
    image=json['image'];
    roles=json['roles'];
    phone=json['phone'];
    wallet=json['wallet'];
    v=json['__v'];
  }
}
