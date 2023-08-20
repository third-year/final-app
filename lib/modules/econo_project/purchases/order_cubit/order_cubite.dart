import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/modules/econo_project/purchases/order_cubit/order_states.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import '../../../../models/econo_app/my_order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/network/end_points.dart';


class OrderCubit extends Cubit<OrderStates>{
  OrderCubit():super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  MyOrderModel? myordermodel;

  void getMyOrders(){
    
    emit(OrderLoadingState());
    DioHelper.getData(url: MYORDER,
    token: 'Bearer $token',
    ).then((value) {
      myordermodel=MyOrderModel.fromjson(value.data);
      printfulltext(myordermodel.toString());
      emit(OrderSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(OrderErrorState());
    });
  }
}