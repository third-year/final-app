
class SignUpModel{
  late bool  status;
  late String message;
 late DataModel data;

  SignUpModel.fromjson(Map<String,dynamic> json){
    message=json['message'];
    status=json['status'];
    data=(json['data']!= null? DataModel.fromjson(json['data']):null)!;
   // data=DataModel.fromjson(json['data']);
  }
}
class DataModel{
  late UserModel user;

  DataModel.fromjson(Map<String,dynamic> json){
    user=UserModel.fromjson(json['user']);

  }
}
class UserModel {

  late String firstname;
  late String lastname;
  late String email;
  late String password;
  late String passwordConfirm;
  late  int phone;
  late String image;


  UserModel.fromjson(Map<String,dynamic>json){
    firstname=json['firstname'];
    lastname=json['lastname'];
    email=json['email'];
    password=json['password'];
    passwordConfirm=json['passwordConfirm'];
    phone=json['phone'];
    image=json['image'];
  }

}




/*{"firstname":"mmmm",
 "lastname":"bbbb",
 "email":"reem@gmail.com",
 "password":"11223456",
 "passwordConfirm":"11223456",
 "phone":"12345678",
 "image":"lhkhkvg"


}*/