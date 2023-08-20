class GetRivewModel
{
  dynamic ?satuts;
  dynamic ?results;
  GetRivewDataModel? data;
  GetRivewModel.fromjson(Map<String,dynamic>json)
  {
    results = json['results'];
    satuts = json['satuts'];
    data = GetRivewDataModel.fromjson(json['data']);
  }
}


class GetRivewDataModel
{

  List<reviewsModel>reviews=[] ;

  GetRivewDataModel.fromjson(Map<String,dynamic>json)
  {
   json['reviews'].forEach((element)
   {
     reviews.add(reviewsModel.fromjson(element));
   });

  }
}

class reviewsModel
{
  dynamic ?_id;
  dynamic? review;
  dynamic ?rating;
  dynamic ?product;
  usermodel? user;
  dynamic ?createdAt;
  dynamic? __v;
  dynamic ?id;


  reviewsModel.fromjson(Map<String,dynamic>json)
  {
    _id = json['_id'];
    review = json['review'];
    rating = json ['rating'];
    product = json ['product'];
    user = usermodel.fromjson(json['user']);
    createdAt = json ['createdAt'];
    __v = json ['__v'];
    id = json ['id'];


  }


}
class usermodel
{
  dynamic ?_id;
  dynamic ? fullName;
  usermodel.fromjson(Map<String,dynamic>json){
    _id = json['_id'];
    fullName = json['fullName'];
  }
}