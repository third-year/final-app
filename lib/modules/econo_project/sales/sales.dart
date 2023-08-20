import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/modules/econo_project/add_product/add_product.dart';
import 'package:firstflutterproject/modules/econo_project/sales/sales_cubit/sales_cubit.dart';
import 'package:firstflutterproject/modules/econo_project/sales/sales_cubit/sales_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../models/econo_app/my_sales_model.dart';

class SalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCubit, SalesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: SalesCubit.get(context).mysalesmodel != null,
            builder: (context) => Stack(children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ListView.separated(
                  itemBuilder: (context, index) => buildfavitem(
                      SalesCubit.get(context).mysalesmodel!.data![index],
                      context),
                  separatorBuilder: (context, index) => Divider(
                    height: 1.0,
                    thickness: 2.0,
                  ),
                  itemCount: SalesCubit.get(context).mysalesmodel!.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FloatingActionButton(
                            child: Center(
                                child: Icon(
                              Icons.add,
                              size: 40,
                            )),
                            backgroundColor: strongColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => add_product()),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: strongColor,
              ),
            ),
          );
        });
  }

  Widget buildfavitem(SalesDataModel? model, context) => Padding(
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
                Text(model!.product!.name!.toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
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
