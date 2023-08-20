
import 'package:firstflutterproject/modules/econo_project/product_categoies/food/food_cubit/food_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/components/constants.dart';
import '../../../../../shared/network/end_points.dart';
import '../../../../../shared/network/remote/dio_helper.dart';

class FoodCubite extends Cubit<FoodStates> {
  FoodCubite() : super(FoodInitialState());

  static FoodCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getFooddata() {
    emit(FoodLodingHome());
    DioHelper.getData(
      url: '$PROCAT=food',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(FoodSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(FoodErrorHome());
    });
  }
}