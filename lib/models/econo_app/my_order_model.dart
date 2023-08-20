class MyOrderModel {
  dynamic? status;
  int? results;
  List<DataModel>? data =[];

  MyOrderModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
    results=json['results'];
    json['data'].forEach((element){
      data?.add(DataModel.fromjson(element));
    });
  }
}

class DataModel{
  dynamic? _id;
  ProductModel? product;
  dynamic? productOwner;
  dynamic? orderOwner;
  int? quantitySell;
  List<dynamic>? destinationAddress=[];
  dynamic? distance;
  dynamic? toBeDelivered;
  dynamic? deliveryPrice;
  dynamic? __v;
  dynamic? id;

  DataModel.fromjson(Map<String,dynamic>json){
    _id=json['_id'];
    product=ProductModel.fromjson(json['product']);
    productOwner=json['productOwner'];
    orderOwner=json['orderOwner'];
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

class ProductModel {
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
  AddressWordModel?addressInWords ;
  dynamic ? id;

  ProductModel.fromjson(Map<String, dynamic> json){
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
    addressInWords=AddressWordModel.fromjson(json['addressInWords']);
    id = json['id'];
  }
}

class AddressWordModel{
  String? country;
  String? city;

  AddressWordModel.fromjson(Map<String,dynamic>json){
    country=json['country'];
    city=json['city'];
  }
}