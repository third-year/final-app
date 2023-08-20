import 'dart:ui';

import 'package:firstflutterproject/shared/network/language/status_lan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../local/cache_helper.dart';

class LanCubit extends Cubit<LanStates> {
  LanCubit() : super(LanInitialState());
  static LanCubit get(context) => BlocProvider.of(context);
  Future<void> getSavedLanguage() async {
    String lanCode;
    if (CacheHelper.getData(key: 'Lang') == null) {
      lanCode = "en";
    } else {
      lanCode = await CacheHelper.getData(key: 'Lang');
    }

    emit(ChangeLocaleState(locale: Locale(lanCode)));
  }

  Future<void> change(String type) async {
    await CacheHelper.saveData(key: 'Lang', value: type);
    emit(ChangeLocaleState(locale: Locale(type)));
  }
}

//  void  change(String type){
//
//   switch( type ){
//    case 'en':
//    applocal=Locale("en");
//    CachHelper.saveData(key: 'lang', value: 'en');
//    break;
//
//    case 'ar':
//    applocal=Locale("ar");
//    CachHelper.saveData(key: 'lang', value: 'ar');
//    break;
// default:
//  applocal=Locale("en");
//  CachHelper.saveData(key: 'lang', value: 'en');
//
//
//   }
// CachHelper.saveData(key: 'lang', value: type);
//  applocal=  Locale( CachHelper.getData( key: 'lang'));
