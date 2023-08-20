import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/models/econo_app/my_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import 'order_cubit/order_cubite.dart';
import 'order_cubit/order_states.dart';

class PurchasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: OrderCubit.get(context).myordermodel != null,
            builder: (context) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.separated(
                itemBuilder: (context, index) => buildfavitem(
                    OrderCubit.get(context).myordermodel!.data![index],
                    context),
                separatorBuilder: (context, index) => Divider(
                  height: 1.0,
                  thickness: 2.0,
                ),
                itemCount: OrderCubit.get(context).myordermodel!.data!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: strongColor,
              ),
            ),
          );
        });
  }

  Widget buildfavitem(DataModel? model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        child: Row(
          children: [
            Image(
              image: MemoryImage(
                  convertBase64Image(model!.product!.image.toString())),
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model!.product!.name.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  model!.product!.price.toString(),
                  style: TextStyle(color: strongColor, fontSize: 17.0),
                )
              ],
            ),
          ],
        ),
      ));
}
