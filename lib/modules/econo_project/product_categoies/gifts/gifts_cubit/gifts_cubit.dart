
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/gifts/gifts_cubit/gifts_states.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/econo_app/prod_cate_model.dart';
import '../../../../../shared/network/end_points.dart';

class GiftsCubite extends Cubit<GiftsStates> {
  GiftsCubite() : super(GiftsInitialState());

  static GiftsCubite get(context) => BlocProvider.of(context);

  ProCatModel ? procatmodel;

  void getGiftsdata() {
    emit(GiftsLodingHome());
    DioHelper.getData(
      url: '$PROCAT=gifts',
      token: 'Bearer $token',
    ).then((value) {
      procatmodel = ProCatModel.fromjson(value.data);
      printfulltext(procatmodel!.data!.resultProducts![0].name.toString());
      emit(GiftsSuccessHome());
    }).catchError((error) {
      print(error.toString());
      emit(GiftsErrorHome());
    });
  }
}