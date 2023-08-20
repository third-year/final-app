class RivewModel
{
  dynamic ?status;
  RivewDataModel? data;
  RivewModel.fromjson(Map<String,dynamic>json)
  {
    status = json['status'];
    data = RivewDataModel.fromjson(json['data']);
  }
}


class RivewDataModel
{
  reviewModel ?review;
  RivewDataModel.fromjson(Map<String,dynamic>json)
  {
    review = reviewModel.fromjson(json['review']);
  }
}

class reviewModel
{
  dynamic ?review;
  dynamic? rating;
  dynamic ?product;
  dynamic ?user;
  dynamic ?_id;
  dynamic ?createdAt;
  dynamic? __v;
  dynamic ?id;

  reviewModel.fromjson(Map<String,dynamic>json)
  {
    review = json['review'];
    rating = json ['rating'];
    product = json ['product'];
    user = json ['user'];
    _id = json ['_id'];
    createdAt = json ['createdAt'];
    __v = json ['__v'];
    id =json['id'];
    
  }
}