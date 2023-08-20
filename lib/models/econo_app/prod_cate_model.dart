class ProCatModel{
  dynamic?  status;
  int? results;
  ProCatDataModel? data ;

  // HomeModel({
  //   this .status,
  //   required this .data
  // });

  ProCatModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
    results=json['results'];
    data=ProCatDataModel.fromjson(json['data']);
  }
}
class ProCatDataModel {
  List<ProCatProductsModel>? resultProducts =[] ;

//   HomeDataModel({
//     required this.products
// });


  ProCatDataModel.fromjson(Map<String, dynamic>json){
    json['resultProducts'].forEach((element){
      resultProducts?.add(ProCatProductsModel.fromjson(element));
    });
  }
}

class ProCatProductsModel{
  dynamic ? id1;
  String ? name;
  String ? description;
  dynamic ? price;
  String ? image;
  dynamic ? quantity;
  List<dynamic>?address=[];
  dynamic? ratingsAverage;
  dynamic?ratingsQuantity;
  String ? category;
  String ? status;
  dynamic ? userId;
  dynamic ? id;
  bool?isFav;

//   DocsModel({
//     this.id1,
//     this.name,
//     this.description,
//     this.price,
//     this.image,
//     this.quantity,
//     this.address,
//     this.categories,
//     this.status,
//     this.userId,
//     this.v,
//     this.readableAddress,
//     this.id
// });

  ProCatProductsModel.fromjson(Map<String,dynamic> json){
    name=json['name'];
    id1 =json['_id'];
    description=json['description'];
    price=json['price'];
    image=json['image'];
    quantity=json['quantity'];
    json['address'].forEach((element){
      address?.add(element);
    });
    ratingsQuantity=json['ratingsQuantity'];
    ratingsAverage=json['ratingsAverage'];
    category=json['category'];
    status=json['status'];
    userId=json['userId'];
    id=json['id'];
    isFav=json['isFav'];

  }
}