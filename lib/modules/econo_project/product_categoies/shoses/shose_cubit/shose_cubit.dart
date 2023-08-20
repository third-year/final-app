
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/shoses/shose_cubit/shose_states.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/network/end_points.dart';

class ShoseCubite extends Cubit<ShoseStates> {
  ShoseCubite() : super(ShoseInitialState());

  static ShoseCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getShosedata() {
    emit(ShoseLodingHome());
    DioHelper.getData(
      url: '$PROCAT=shoes',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(ShoseSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(ShoseErrorHome());
    });
  }
}