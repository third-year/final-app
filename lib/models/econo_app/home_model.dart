class HomeModel{
   dynamic?  status;
   int? results;
   HomeDataModel? data ;

  // HomeModel({
  //   this .status,
  //   required this .data
  // });

  HomeModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
    results=json['results'];
    data=HomeDataModel.fromjson(json['data']);
  }
}
class HomeDataModel {
   List<ProductsModel>? resultProducts =[] ;

//   HomeDataModel({
//     required this.products
// });


  HomeDataModel.fromjson(Map<String, dynamic>json){
    json['resultProducts'].forEach((element){
      resultProducts?.add(ProductsModel.fromjson(element));
    });
  }
}

class ProductsModel{
  dynamic ? ratingsAverage;
  dynamic ? ratingsQuantity;
   dynamic ? id1;
   String ? name;
   String ? description;
   dynamic ? price;
   String ? image;
   dynamic ? quantity;
  List<dynamic>?address=[];
   String ? categories;
   String ? status;
   dynamic ? userId;
   dynamic ? id;
   dynamic ?isFav;

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

  ProductsModel.fromjson(Map<String,dynamic> json){
    ratingsAverage=['ratingsAverage'];
    ratingsQuantity=['ratingsQuantity'];
    name=json['name'];
  id1 =json['_id'];
  description=json['description'];
  price=json['price'];
  image=json['image'];
  quantity=json['quantity'];
  json['address'].forEach((element){
    address?.add(element);
  });
  categories=json['categories'];
  status=json['status'];
  userId=json['userId'];
  id=json['id'];
  isFav=json['isFav'];

  }
}