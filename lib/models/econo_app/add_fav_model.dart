class AddFavModel{
  String? status;

  AddFavModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
  }


}