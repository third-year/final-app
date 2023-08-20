
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/network/end_points.dart';
import 'furniture_states.dart';

class FurnitureCubite extends Cubit<FurnitureStates> {
  FurnitureCubite() : super(FurnitureInitialState());

  static FurnitureCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getFurnituredata() {
    emit(FurnitureLodingHome());
    DioHelper.getData(
      url: '$PROCAT=furniture',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(FurnitureSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(FurnitureErrorHome());
    });
  }
}