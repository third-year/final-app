import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:firstflutterproject/modules/econo_project/login_econo/login_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/home_lyout/home_lyout.dart';
import '../../../../models/econo_app/login_model.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/network/remote/dio_helper.dart';


class ELoginCubit extends Cubit<ELoginSates>{

  ELoginCubit():super(LoginInitialState());
   static ELoginCubit get(context)=>BlocProvider.of(context);
    Login_Models? loginModel;
  void userlogin({
    required String email,
    required String password,
    context
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        },
    ).then((value) {
      loginModel=Login_Models.fromjson(value.data);
      print(loginModel.toString());
       token=loginModel!.token.toString();
      CacheHelper.saveData(key: 'password1', value: password);
      emit(LoginSuccessState(loginModel));

    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void forgetpaasswordc({
    required String email,

  }){
    emit(ForgetLoadingState());
    DioHelper.postData(
        url:FORGETPASS,
        data: {
          'email':email,
        }
    ).then((value) {
      print(value.data);
      emit(ForgetSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ForgetErrorState());
    });
  }


  void codepaasswordc({
    required String code,

  }){
    emit(CodeLoadingState());
    DioHelper.getData(url: CHECKRESTO+code,
    ).then((value) {
      print(value.data);
      emit(CodeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CodeErrorState());
    });
  }
  void newpaasswordc({
    required String password,
    required String conpassword,
    required String code1

  }){
    emit(NewLoadingState());
    DioHelper.postData(
        url: '$RESTPASS/$code1',
        data: {

          'password':password,
          'passwordConfirm':conpassword

        }
    ).then((value) {
      print(value.data);
      emit(NewSuccessState());

    }).catchError((error){
      print(error.toString());
      print('$RESTPASS/$code1');
      emit(NewErrorState());
    });
  }
  IconData suffix = Icons.visibility_off_outlined;
  bool ispassword = true;
  void changpassword(){
    ispassword=!ispassword;
    suffix =ispassword? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ShopChangePasswordd());
  }
}