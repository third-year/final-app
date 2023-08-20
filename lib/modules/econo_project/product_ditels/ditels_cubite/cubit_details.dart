import 'package:dio/dio.dart';
import 'package:firstflutterproject/layout/home_lyout/home_lyout.dart';
import 'package:firstflutterproject/modules/econo_project/product_ditels/ditels_cubite/statesDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../constant.dart';
import '../../../../layout/home_lyout/cubite/cubite.dart';
import '../../../../models/econo_app/getRivewModel.dart';
import '../../../../models/econo_app/modelDetails.dart';
import '../../../../models/econo_app/quintityModel.dart';
import '../../../../models/econo_app/rivewModel.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../purchases/order_cubit/order_cubite.dart';
import '../../sales/sales_cubit/sales_cubit.dart';

class DetailsCubit extends Cubit<DitailsStates> {
  DetailsCubit() : super(ShopIniteilState());

  double counter = 1;
  dynamic prid;
  static DetailsCubit get(context) => BlocProvider.of(context);

  DetailsModel? detailsModel;
  RivewModel? Rivew;
  GetRivewModel? getRivewModel;
  QuintityModel? quintityModel;

  void getDetails() {
    emit(DitailsLoding());
    DioHelper.getData(
      url: DEtails + prid,
      token: 'Bearer $token',
    ).then((value) {
      detailsModel = DetailsModel.fromjson(value.data);
      printFullText(detailsModel!.data!.product!.price.toString());
      print(detailsModel?.status);

      emit(DitailsSuccses());
    }).catchError((erroe) {
      emit(DitailsError());
      print(erroe.toString());
    });
  }

  void postData({
    required dynamic review,
    required dynamic rating,
  }) {
    emit(DitailsLoding());
    DioHelper.postData(
        token: 'Bearer $token',
        url: '$SendRivew$prid/reviews',
        data: {
          "review": review,
          "rating": rating,
        }).then((value) async {
      print(value.data);
      Rivew = RivewModel.fromjson(value.data);
      emit(RivewStatesSuccses(Rivew!));
      print(Rivew?.status);
      getRivew();
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
      emit(RivewStatesError(error.toString()));

      //print(error.toString());
    });
  }

  void getRivew() {
    emit(GetRivewStateLoding());
    DioHelper.getData(
      url: '$GetRivew$prid/reviews',
      token: 'Bearer $token',
    ).then((value) {
      getRivewModel = GetRivewModel.fromjson(value.data);
      printFullText(getRivewModel!.data!.reviews.toString());
      print(getRivewModel?.satuts);

      emit(GetRivewStateSuccess());
    }).catchError((erroe) {
      emit(GetRivewStateError());
      print(erroe.toString());
    });
  }

  void postQuintity(
      {required dynamic destinationAddress,
      required dynamic quantitySell,
      context}) {
    emit(DitailsLoding());
    DioHelper.postData(
        token: 'Bearer $token',
        url: '$PostQuintity$prid',
        data: {
          "destinationAddress": destinationAddress,
          "quantitySell": quantitySell,
        }).then((value) async {
      print(value.data);
      quintityModel = QuintityModel.fromjson(value.data);
      SalesCubit.get(context).getMySales();
      OrderCubit.get(context).getMyOrders();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeLyoutScreen()),
          (route) => false);
      EconoCubite.get(context).gethomedata();
      emit(QuintityStatesSuccses(quintityModel!));
      print(quintityModel?.status);
    }).catchError((error) {
      if (error is DioError) {
        Alert(
                context: context,
                title: "ERROR",
                desc: "Please charge your wallet first.")
            .show();
      }
      emit(QuintityStatesError(error.toString()));

      print(error.toString());
    });
  }

  void minuis() {
    if (counter <= 0) {
      counter = 1;
    }
    counter--;
    emit(CounterMinueState());
  }

  void add() {
    counter++;
    emit(CounterPluseState());
  }
}
