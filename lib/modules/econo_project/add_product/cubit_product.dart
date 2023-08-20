import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:firstflutterproject/modules/econo_project/add_product/state_product.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/home_lyout/home_lyout.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class product_cubit extends Cubit<state_product> {
  product_cubit() : super(productIntialState());
  static product_cubit product(context) => BlocProvider.of(context);

  void addproduct(
      {required name,
      required price,
      required quantity,
      required category,
      required status,
      required description,
      required image,
      required address,
      context}) {
    emit(productLoadState());
    DioHelper.postData(
      url: HOME,
      token: 'Bearer $token',
      data: {
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'quantity': quantity,
        'address': address,
        'category': category,
        'status': status,
      },
    ).then((value) {
      print(value.data);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeLyoutScreen()),
          (route) => false);
      EconoCubite.get(context).gethomedata();
      emit(productSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(productErrorState());
    });
  }

  void ChargeWallet({required charger, context}) {
    emit(ChargeLoadState());
    DioHelper.postData(
        token: 'Bearer $token',
        url: CHARGEWALLET,
        data: {'wallet': charger}).then((value) {
      print(value.data);
      ProfileCubit.get(context).getprofileinfo();
      emit(ChargeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChargeErrorState());
    });
  }
}
