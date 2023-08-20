import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import '../../../../models/econo_app/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/network/end_points.dart';
import 'fav_states.dart';


class FavCubit extends Cubit<FavStates>{
  FavCubit():super(FavInitialState());

  static FavCubit get(context) => BlocProvider.of(context);

  FavoriteModel? favmodel;

  void getFav(){
    emit(FavLoadingState());
    DioHelper.getData(url: FAV,
      token: 'Bearer $token',
    ).then((value) {
      favmodel=FavoriteModel.fromjson(value.data);
      printfulltext(value.data);
      emit(FavSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(FavErrorState());
    });
  }
}