import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/food/food_cubit/food_cubit.dart';
import 'package:firstflutterproject/modules/econo_project/product_categoies/food/food_cubit/food_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../layout/home_lyout/cubite/cubite.dart';
import '../../../../models/econo_app/prod_cate_model.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubite, FoodStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var prodcatcubit = FoodCubite.get(context).procatmodel;
        return ConditionalBuilder(
          condition: prodcatcubit != null,
          builder: (context) => productsCateBilder(prodcatcubit, context),
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: strongColor,
          )),
        );
      },
    );
  }

  Widget productsCateBilder(ProCatModel? model, context) => Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 35.0,
            ),
            color: strongColor,
          ),
        ],
        title: Text('starz'.toUpperCase(),
            style: TextStyle(
                fontSize: 30.0,
                color: secondBackColor,
                fontWeight: FontWeight.w500)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model!.data!.resultProducts![0].category
                        .toString()
                        .toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: midColor),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    color: EconoCubite.get(context).isDark
                        ? Color(0xFF333739)
                        : Colors.white,
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.5,
                      crossAxisSpacing: 1.5,
                      childAspectRatio: 1 / 1.54,
                      children: List.generate(
                          model.data!.resultProducts!.length, (index) {
                        return buildGridProduct(
                            model.data!.resultProducts![index], context);
                      }),
                    ),
                  )
                ],
              ),
            ),
          ])));

  Widget buildGridProduct(ProCatProductsModel model, context) =>
      GestureDetector(
          onTap: () {
            EconoCubite.get(context).gotoditels(model.id, context);
          },
          child: Container(
            color: EconoCubite.get(context).isDark
                ? Color(0xFF333739)
                : Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(alignment: AlignmentDirectional.bottomStart, children: [
                Image(
                  image:
                      MemoryImage(convertBase64Image(model.image.toString())),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 191,
                )
                //Container(
                //   color: Colors.red,
                //   padding: EdgeInsets.symmetric(horizontal:5.0 ),
                //   child: Text('Discount',
                //   style: TextStyle(55
                //     fontSize: 10.0,
                //     color:Colors.white
                //   ),
                //   ),
                // )
              ]),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          model.price.toString(),
                          style: TextStyle(
                              fontSize: 14.0, height: 1.3, color: strongColor),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            size: 25.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ));
}
