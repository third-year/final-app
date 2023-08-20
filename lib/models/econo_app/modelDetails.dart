class DetailsModel
{
   dynamic ?status;
   DetailsDataModel? data;
   DetailsModel.fromjson(Map<String,dynamic>json)
   {
     status = json['status'];
     data = DetailsDataModel.fromjson(json['data']);
   }
}


class DetailsDataModel
{
  productModel ?product;
 DetailsDataModel.fromjson(Map<String,dynamic>json)
 {
   product = productModel.fromjson(json['product']);
 }
}

class productModel
{
  dynamic ?_id;
  dynamic? name;
  dynamic ?description;
  dynamic ?price;
  dynamic ?image;
  dynamic ?quantity;
  dynamic? category;
  dynamic ?status;
  List<dynamic>?address=[];
  dynamic ? ratingsAverage;
  dynamic ? ratingsQuantity;
  dynamic ? id;
  dynamic ? userId;
  dynamic ? __v;
  dynamic ? isFav;
  List<dynamic>?reviews=[];
  AddressInWords?addressInWords;
  productModel.fromjson(Map<String,dynamic>json)
  {
    _id = json['_id'];
   name = json['name'];
   description = json ['description'];
   price = json ['price'];
   image = json ['image'];
   quantity = json ['quantity'];
   category = json ['category'];
   status = json ['status'];
   json['address'].forEach((element){
     address?.add(element);});
     ratingsAverage=json['ratingsAverage'];
     ratingsQuantity=json['ratingsQuantity'];
     id =json['id'];
     userId=json['userId'];
     __v=json['__v'];
     isFav=json['isFav'];
     json['reviews'].forEach((element){
       reviews?.add( element);
     });

    addressInWords = AddressInWords.fromjson(json['addressInWords']);
  }
}
class AddressInWords{
  dynamic country;
  dynamic city;
  AddressInWords.fromjson(Map<String,dynamic>json){

    country = json['country'];
    city = json['city'];
  }
}