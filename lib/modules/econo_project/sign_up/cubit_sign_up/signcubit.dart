import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/econo_app/models_sinup.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../cubit_sign_up/states.dart';


class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  late SignUpModel signup;
  void postData({
    required String firstname,
    required String endtname,
    required String email,
    required int phone,
    required String password,
    required String confPassword,
  }) {
    emit(SignUpLodingState());
    DioHelper.postData(
        url: SIGNUP,
        data: {
          "firstName": firstname,
          "lastName": endtname,
          "email": email,
          "password": password,
          "passwordConfirm": confPassword,
          "image": 'vjccjxbhvyvfd',
          "phone": phone,
        }).then((value)async  {
      print(value.data);
      signup =  SignUpModel.fromjson(value.data);
      emit(Successtate(signup!));
      print(signup.status);
    }).catchError((error) {
      if(error is DioError) {
        print(error.response);
      }
      emit(SignUpErrorState(error.toString()));

      //print(error.toString());

    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool ispassword = true;
  void changpassword(){
    ispassword=!ispassword;
    suffix =ispassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(ShopChangePassword());
  }
}
