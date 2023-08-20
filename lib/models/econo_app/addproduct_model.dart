// "status": "success",
// "data": {
// "product": {
// "name": "dfdsg",
// "description": "dsvvvvdfs",
// "price": 123,
// "image": "defevvvvvvvvvvvgfsf",
// "quantity": 12,
// "address": [
// 35.00445,
// 36.25451
// ],
// "ratingsAverage": 1,
// "ratingsQuantity": 0,
// "category": "food",
// "status": "new",
// "userId": "64b834e53befab6a70f39633",
// "_id": "64cba3d2d4cc5c34e17a2052",
// "__v": 0,
// "addressInWords": {
// "country": "Syria",
// "city": "Hama"
// },
// "id": "64cba3d2d4cc5c34e17a2052"
// }
// }

class statusModel {
  late String status;
  late dataModel data;

  statusModel.fromjson(Map<String,dynamic> json){
    data=(json['data']!= null? dataModel.fromjson(json['data']):null)!;

  }

}
class dataModel{

  late  productModel product;

   dataModel.fromjson(Map<String,dynamic> json){
     product=(json['product']!= null? productModel.fromjson(json['product']):null)!;

   }

}

class productModel{
   late String name;
  late String description;
  late String price;
  late String image;
  late String quantity;
  late List<dynamic> address=[];
  late String ratingsAverage;
  late String ratingsQuantity;
  late String category;
  late String userId;
  late String _id;
   late dynamic __v;
  late String id;
  late addressModel addressInWords;

  productModel.fromjson(Map<String,dynamic> json)
  { name=json['name'];
  description=json['description'];
  price=json['price'];
  image=json['image'];
  quantity=json['quantity'];
  //address=json['address'];
  ratingsAverage=json['ratingsAverage'];
  ratingsQuantity=json['ratingsQuantity'];
  category=json['category'];
  userId=json['userId'];
  _id=json['_id'];
  __v=json['__v'];
  id=json['id'];
  addressInWords=(json['addressInWords']!= null? addressModel.fromjson(json['addressInWords']):null)!;
  json['address'].forEach((element){
    address.add(element);
  });



  }
}


class addressModel{
  late String country;
  late String city;
  addressModel.fromjson(Map<String,dynamic> json)
  { country=json['country'];
     country=json['country'];
  }
}