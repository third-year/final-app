import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/models/econo_app/profile_model.dart';
import 'package:firstflutterproject/modules/econo_project/change_password/change_password.dart';
import 'package:firstflutterproject/modules/econo_project/profile/econo_profile.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_states.dart';
import 'package:firstflutterproject/shared/network/end_points.dart';
import 'package:firstflutterproject/shared/network/local/cache_helper.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../models/econo_app/edite_profile_model.dart';
import '../../../../shared/components/constants.dart';
import '../../edite_profile/edite_profile.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit():super(ProfileInitialState());
  
  static ProfileCubit get(context) => BlocProvider.of(context);
  
  ProfileModel? profilemodel;
  
  void getprofileinfo(){
    emit(ProfileLoadingState());
    DioHelper.getData(url: PROFILE,
    token: 'Bearer $token'
    ).then((value) {
      profilemodel=ProfileModel.fromjson(value.data);
      printfulltext(profilemodel!.user!.phone.toString());
      emit(ProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ProfileErrorState());
    });
  }

  void edite(context){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>
                EconoEditeProfileScreen()));
    emit(GoToEditeSuccessState());
}

 EditeProfileModel? editepromodel;

  void update({
  @required fullName,
    @required phone,
    context
}) {
    emit(ProfileEditeLoadingState());
    DioHelper.patchData(url:EDITE,
        token: 'Bearer $token',
        data: {
      'fullName':fullName,
      'phone':phone
        }
    ).then((value) {
      editepromodel=EditeProfileModel.fromjson(value.data);
      printfulltext(profilemodel!.user!.phone.toString());
      getprofileinfo();
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>
                  EconoProfileScreen()));
      emit(ProfileEditeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ProfileEditeErrorState());
    });
  }

  void toChangePass(context){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>
                ChangePasswordScreen()));
    emit(GoToChangePassSuccessState());
  }

  bool show=false;

  void shownewpass(){
    show=true;
    emit(showNewPass());
  }

  void updatepass({
    @required oldpass,
    @required newpass,
    @required confpass,
    context
  }) {
    emit(ProfileEditePassLoadingState());
    DioHelper.patchData(url:EDITEPASS,
        token: 'Bearer $token',
        data: {
          'passwordCurrent':oldpass,
          'password':newpass,
          'passwordConfirm':confpass
        }
    ).then((value) {
      password1=newpass;
      password1=CacheHelper.saveData(key: 'password1', value: newpass);
      getprofileinfo();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
              builder: (context) =>
                  EconoProfileScreen())
          ,(route)=>true);
      emit(ProfileEditePassSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ProfileEditePassErrorState());
    });
  }

}