
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/network/end_points.dart';
import 'technology_states.dart';

class TechnologyCubite extends Cubit<TechnologyStates> {
  TechnologyCubite() : super(TechnologyInitialState());

  static TechnologyCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getTechnologydata() {
    emit(TechnologyLodingHome());
    DioHelper.getData(
      url: '$PROCAT=technology',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(TechnologySuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(TechnologyErrorHome());
    });
  }
}