import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/modules/econo_project/sales/sales_cubit/sales_states.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/econo_app/my_sales_model.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/end_points.dart';


class SalesCubit extends Cubit<SalesStates>{
  SalesCubit():super(SalesInitialState());

  static SalesCubit get(context) => BlocProvider.of(context);

  MySalesModel? mysalesmodel;

  void getMySales(){

    emit(SalesLoadingState());
    DioHelper.getData(url:SALES,
      token: 'Bearer $token',
    ).then((value) {
      mysalesmodel=MySalesModel.fromjson(value.data);
      printfulltext(mysalesmodel.toString());
      emit(SalesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SalesErrorState());
    });
  }
}