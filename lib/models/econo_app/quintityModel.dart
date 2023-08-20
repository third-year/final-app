class QuintityModel
{
  dynamic ?status;
  OrderModel? order;

  QuintityModel.fromjson(Map<String,dynamic>json)
  {
    status = json['status'];
    order = OrderModel.fromjson(json['order']);
  }
}


class OrderModel
{
  dynamic product;
  dynamic productOwner;
  dynamic orderOwner;
  dynamic quantitySell;
  List<dynamic>?destinationAddress=[];
  dynamic distance;
  dynamic toBeDelivered;
  dynamic deliveryPrice;
  dynamic _id;
  dynamic __v;
  DestinationAddressInWords ?destinationAddressInWords;
  dynamic id;
  OrderModel.fromjson(Map<String,dynamic>json)
  {
    product = json['product'];
    productOwner = json['productOwner'];
    orderOwner = json['orderOwner'];
    quantitySell = json['quantitySell'];
    distance = json['distance'];
    toBeDelivered = json['toBeDelivered'];
    deliveryPrice = json['deliveryPrice'];
    _id = json['_id'];
    __v = json['__v'];
    id = json['id'];
    destinationAddressInWords = DestinationAddressInWords.fromjson(json['destinationAddressInWords']);

    json['destinationAddress'].forEach((element){
      destinationAddress?.add( element);
    });
  }
}

class DestinationAddressInWords
{
 dynamic country;
 dynamic city;

 DestinationAddressInWords.fromjson(Map<String,dynamic>json)
  {
    country = json['country'];
    city = json ['city'];


  }
}