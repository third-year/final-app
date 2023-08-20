
import 'package:firstflutterproject/models/econo_app/profile_model.dart';

class MySalesModel {
  dynamic? status;
  int? results;
  List<SalesDataModel>? data =[];

  MySalesModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
    results=json['results'];
    json['data'].forEach((element){
      data?.add(SalesDataModel.fromjson(element));
    });
  }
}

class SalesDataModel{
  dynamic? _id;
  SalesProductModel? product;
  UserModel? orderOwner;
  int? quantitySell;
  List<dynamic>? destinationAddress=[];
  dynamic? distance;
  dynamic? toBeDelivered;
  dynamic? deliveryPrice;
  dynamic? __v;
  dynamic? id;

  SalesDataModel.fromjson(Map<String,dynamic>json){
    _id=json['_id'];
    product=SalesProductModel.fromjson(json['product']);
    orderOwner=UserModel.fromjson(json['orderOwner']);
    quantitySell=json['quantitySell'];
    json['destinationAddress'].forEach((element){
      destinationAddress?.add(element);
    });
    distance=json['distance'];
    toBeDelivered=json['toBeDelivered'];
    deliveryPrice=json['deliveryPrice'];
    __v=json['__v'];
    id=json['id'];
  }

}

class SalesProductModel {
  dynamic ? _id;
  String ? name;
  String ? description;
  dynamic ? price;
  String ? image;
  dynamic ? quantity;
  List<dynamic>?address = [];
  dynamic ? ratingsAverage;
  dynamic ? ratingsQuantity;
  String ? category;
  String ? status;
  dynamic ? userId;
  dynamic ? __v;
  SalesAddressWordModel?addressInWords ;
  dynamic ? id;

  SalesProductModel.fromjson(Map<String, dynamic> json){
    _id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    json['address'].forEach((element) {
      address?.add(element);
    });
    ratingsAverage = ['ratingsAverage'];
    ratingsQuantity = ['ratingsQuantity'];
    category = json['category'];
    status = json['status'];
    userId = json['userId'];
    __v = json['__v'];
    addressInWords=SalesAddressWordModel.fromjson(json['addressInWords']);
    id = json['id'];
  }
}

class SalesAddressWordModel{
  String? country;
  String? city;

  SalesAddressWordModel.fromjson(Map<String,dynamic>json){
    country=json['country'];
    city=json['city'];
  }
}
