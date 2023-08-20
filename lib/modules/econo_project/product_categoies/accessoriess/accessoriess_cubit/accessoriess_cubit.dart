import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/components/constants.dart';
import '../../../../../shared/network/end_points.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import 'accessoriess_state.dart';

class AccessoriesCubite extends Cubit<AccessoriesStates> {
  AccessoriesCubite() : super(AccessoriesInitialState());

  static AccessoriesCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getAccessoriesdata() {
    emit(AccessoriesLodingHome());
    DioHelper.getData(
      url: '$PROCAT=accessories',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(AccessoriesSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(AccessoriesErrorHome(error.toString()));
    });
  }
}