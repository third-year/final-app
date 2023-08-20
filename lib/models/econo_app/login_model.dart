
class Login_Models{
   String? status;
   String?  token;

  Login_Models.fromjson(Map<String,dynamic> json)
  { status=json['status'];
  token=json['token'];
  }
}

