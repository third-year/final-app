import 'package:firstflutterproject/models/econo_app/my_order_model.dart';

class FavoriteModel{
  dynamic?  satuts;
  int? results;
  FavDataModel? data ;

  FavoriteModel.fromjson(Map<String,dynamic>json){
    satuts=json['satuts'];
    results=json['results'];
    data=FavDataModel.fromjson(json['data']);
  }
}

class FavDataModel {
  List<FavModel>? favorites =[] ;

  FavDataModel.fromjson(Map<String, dynamic>json){
    json['favorites'].forEach((element){
      favorites?.add(FavModel.fromjson(element));
    });
  }
}

class FavModel{
  dynamic? _id;
  ProductFavModel? product;
  dynamic? user;
  dynamic? createdAt;
  dynamic? __v;

  FavModel.fromjson(Map<String,dynamic>json){
    _id=json['_id'];
    product=ProductFavModel.fromJson(json['product']);
    user=json['user'];
    createdAt=json['createdAt'];
    __v=json['__v'];
  }
}

class ProductFavModel {
  String? sId;
  String? name;
  String? description;
  int? price;
  String? image;
  int? quantity;
  List<double>? address;
  dynamic? ratingsAverage;
  dynamic? ratingsQuantity;
  String? category;
  String? status;
  String? userId;
  int? iV;
  FavAddressInWords? addressInWords;
  String? id;

  ProductFavModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    json['address'].forEach((element){
      address?.add(element);
    });    ratingsAverage = json['ratingsAverage'];
    ratingsQuantity = json['ratingsQuantity'];
    category = json['category'];
    status = json['status'];
    userId = json['userId'];
    iV = json['__v'];
    addressInWords = json['addressInWords'] != null
        ? new FavAddressInWords.fromJson(json['addressInWords'])
        : null;
    id = json['id'];
  }
}

class FavAddressInWords {
  String? country;
  String? city;

  FavAddressInWords.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }

}

// class FavoriteModel {
//   String? satuts;
//   int? results;
//   Data? data;
//
//   FavoriteModel({this.satuts, this.results, this.data});
//
//   FavoriteModel.fromJson(Map<String, dynamic> json) {
//     satuts = json['satuts'];
//     results = json['results'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['satuts'] = this.satuts;
//     data['results'] = this.results;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<Favorites>? favorites;
//
//   Data({this.favorites});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['favorites'] != null) {
//       favorites = <Favorites>[];
//       json['favorites'].forEach((v) {
//         favorites!.add(new Favorites.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.favorites != null) {
//       data['favorites'] = this.favorites!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Favorites {
//   String? sId;
//   Product? product;
//   String? user;
//   String? createdAt;
//   int? iV;
//
//   Favorites({this.sId, this.product, this.user, this.createdAt, this.iV});
//
//   Favorites.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     product =
//     json['product'] != null ? new Product.fromJson(json['product']) : null;
//     user = json['user'];
//     createdAt = json['createdAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     data['user'] = this.user;
//     data['createdAt'] = this.createdAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class Product {
//   String? sId;
//   String? name;
//   String? description;
//   int? price;
//   String? image;
//   int? quantity;
//   List<double>? address;
//   int? ratingsAverage;
//   int? ratingsQuantity;
//   String? category;
//   String? status;
//   String? userId;
//   int? iV;
//   AddressInWords? addressInWords;
//   String? id;
//
//   Product(
//       {this.sId,
//         this.name,
//         this.description,
//         this.price,
//         this.image,
//         this.quantity,
//         this.address,
//         this.ratingsAverage,
//         this.ratingsQuantity,
//         this.category,
//         this.status,
//         this.userId,
//         this.iV,
//         this.addressInWords,
//         this.id});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     image = json['image'];
//     quantity = json['quantity'];
//     address = json['address'].cast<double>();
//     ratingsAverage = json['ratingsAverage'];
//     ratingsQuantity = json['ratingsQuantity'];
//     category = json['category'];
//     status = json['status'];
//     userId = json['userId'];
//     iV = json['__v'];
//     addressInWords = json['addressInWords'] != null
//         ? new AddressInWords.fromJson(json['addressInWords'])
//         : null;
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['image'] = this.image;
//     data['quantity'] = this.quantity;
//     data['address'] = this.address;
//     data['ratingsAverage'] = this.ratingsAverage;
//     data['ratingsQuantity'] = this.ratingsQuantity;
//     data['category'] = this.category;
//     data['status'] = this.status;
//     data['userId'] = this.userId;
//     data['__v'] = this.iV;
//     if (this.addressInWords != null) {
//       data['addressInWords'] = this.addressInWords!.toJson();
//     }
//     data['id'] = this.id;
//     return data;
//   }
// }
//
// class AddressInWords {
//   String? country;
//   String? city;
//
//   AddressInWords({this.country, this.city});
//
//   AddressInWords.fromJson(Map<String, dynamic> json) {
//     country = json['country'];
//     city = json['city'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country'] = this.country;
//     data['city'] = this.city;
//     return data;
//   }
// }
