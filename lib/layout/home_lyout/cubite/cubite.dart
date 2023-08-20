
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/states.dart';
import 'package:firstflutterproject/models/econo_app/favorite_model.dart';
import 'package:firstflutterproject/models/econo_app/home_model.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/books/books_screen.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/furneture/furniture_screen.dart';
import 'package:firstflutterproject/modules/econo_project/product_ditels/ditels_cubite/cubit_details.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/econo_app/add_fav_model.dart';
import '../../../modules/econo_project/favorite/favorite.dart';
import '../../../modules/econo_project/prodact/prodact.dart';
import '../../../modules/econo_project/product_categoies/accessoriess/accessoriess_screen.dart';
import '../../../modules/econo_project/product_categoies/clothes/clothes_screen.dart';
import '../../../modules/econo_project/product_categoies/food/food_screen.dart';
import '../../../modules/econo_project/product_categoies/gifts/gifts_screen.dart';
import '../../../modules/econo_project/product_categoies/shoses/books_screen.dart';
import '../../../modules/econo_project/product_categoies/technology/technology_screen.dart';
import '../../../modules/econo_project/product_ditels/ditels_cubite/cubit_details.dart';
import '../../../modules/econo_project/product_ditels/ditels_cubite/cubit_details.dart';
import '../../../modules/econo_project/product_ditels/ditels_cubite/cubit_details.dart';
import '../../../modules/econo_project/product_ditels/productDetails1.dart';
import '../../../modules/econo_project/purchases/purchases.dart';
import '../../../modules/econo_project/sales/sales.dart';
import '../../../modules/econo_project/search/search_screen.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';

class EconoCubite extends Cubit<EconoStates> {
  EconoCubite() : super(EconoInitialState());

  static EconoCubite get(context) => BlocProvider.of(context);
  int curentindex = 0;
  int curentindcat=0;
  List<Widget> screen = [
    ProdactScreen(),
    SalesScreen(),
    PurchasesScreen(),
    FavoriteScreen(),
  ];

  Map<dynamic,bool>isFav={};

  List<ProductsModel> maxprice=[];
  List<ProductsModel> maxrate=[];


  void changBottom(int index) {
    curentindex = index;
    emit(EconoChangeButtomNavState());
  }

List<ProductsModel> names=[];

List<ProductsModel> resultname=[];


  HomeModel ? homemodel;

  HomeModel ? home1;

  void gethomedata() {
    emit(EconoLodingHome());
    DioHelper.getData(
      url: HOME,
      token:'Bearer $token',
    ).then((value) {
      homemodel = HomeModel.fromjson(value.data);
      printfulltext(homemodel!.data!.resultProducts![1].name.toString());
      homemodel!.data!.resultProducts!.forEach((element) {
        isFav.addAll({
          element.id:element.isFav
        });
      });
      homemodel!.data!.resultProducts!.forEach((element) {
        names.add(element);
      });
      print(isFav.toString());
      emit(EconoSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(EconoErrorHome());
    });
  }

  void gotocate(int index , context,String catename){
    if(catename=='furniture') {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>
                  FurnitureScreen()));
      emit(EconoChangeCategories());
    }
      if(catename=='food'){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) =>
                    FoodScreen()));
        emit(EconoChangeCategories());}
        if(catename=='shoes'){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) =>
                      ShoseScreen()));
          emit(EconoChangeCategories());}
          if(catename=='gifts'){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        GiftsScreen()));
            emit(EconoChangeCategories());}
            if(catename=='accessories'){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AccessoriesScreen()));
              emit(EconoChangeCategories());}
              if(catename=='clothes'){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ClothesScreen()));
                emit(EconoChangeCategories());}
                if(catename=='books'){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BooksScreen()));
                  emit(EconoChangeCategories());}
                  if(catename=='technology'){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TechnologyScreen()));
                    emit(EconoChangeCategories());
    }

  }

  void gotosearch(context){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>
                SearchScreen()));
    emit(EconoSuccessgotosearch());
  }

  AddFavModel? addfavmodel;

  void addFav(productId) {
    isFav[productId] = !isFav[productId]!;
    emit(EconoSuccessChangeFav());
    DioHelper.postData(url: '$FAV/$productId',
        token: 'Bearer $token',
        data: {}
    ).then((value) {
      addfavmodel = AddFavModel.fromjson(value.data);
      print(value.data);
      getFav();
      emit(EconoSuccessChangeFav());
    }).catchError((error) {
      isFav[productId] = !isFav[productId]!;
      emit(EconoErrorChangeFav());
      print(error.toString());
    });
  }

  void delFav(productId){
    isFav[productId] = !isFav[productId]!;
    emit(EconoSuccessChangeFav());
    DioHelper.deleteData(url: '$FAV/$productId',
        token:'Bearer $token',
        data: {}
    ).then((value) {
      getFav();
      emit(EconoSuccessChangeFav());
    }).catchError((error){
      isFav[productId] = !isFav[productId]!;
      emit(EconoErrorChangeFav());
      print(error.toString());
    });
  }

  FavoriteModel? favmodel;

  void getFav(){
    emit(FavLoadingState());
    DioHelper.getData(url: FAV,
      token: 'Bearer $token',
    ).then((value) {
      favmodel=FavoriteModel.fromjson(value.data);
      printfulltext(favmodel.toString());
      emit(FavSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(FavErrorState());
    });
  }

  void getsearch(String resname){
      resultname=[];
    emit(EconoLodingsearch());
    names.forEach((element) {
      if(element.name!.toLowerCase().contains(resname.toLowerCase())){
        resultname.add(element);
        emit(EconoSuccesssearch());
      }
    });
  }

  void gotoditels(dynamic id,context){
    DetailsCubit.get(context).prid=id;
    DetailsCubit.get(context).getDetails();
    DetailsCubit.get(context).getRivew();
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>
                Details()
                ));
    emit(EconoSuccessgotoditels());
  }

  // dynamic maxpricev=0;
  // dynamic maxratev=0;
  // void getmax(){
  //   names.forEach((element) {
  //     if(element.price>maxprice){
  //       maxprice=element.price;
  //     }
  //     names.sort(maxprice);
  //   });
  // }


  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changAppMode(){
    isDark = !isDark;
    emit(ChangeModeState());
    print(isDark);

  }


}
