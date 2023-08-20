import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/home_lyout/cubite/cubite.dart';
import '../../../models/econo_app/favorite_model.dart';


class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EconoCubite,EconoStates>(
          listener:(context,state){},
          builder:(context,state){
            return
              ConditionalBuilder(
                condition:state is! FavLoadingState,
            builder: (context)=>
      SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.separated(
          itemBuilder: (context, index) => buildfavitem(EconoCubite.get(context).favmodel!.data!.favorites![index],context),
          separatorBuilder: (context, index) => Divider(
                height: 1.0,
                thickness: 2.0,
              ),
          itemCount: EconoCubite.get(context).favmodel!.data!.favorites!.length,
        shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      ),
    ),
            fallback:(context)=>Center(
              child: CircularProgressIndicator(
              color: strongColor,
            )),
            );
          }
    );
  }
  Widget buildfavitem(FavModel model,context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        child: Row(
          children: [
            Image(
              image: MemoryImage(
        convertBase64Image(
        model.product!.image.toString())),
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
                  model.product!.name.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  model.product!.price.toString(),
                  style: TextStyle(color: strongColor, fontSize: 17.0),
                )
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                if(EconoCubite.get(context).isFav[model.product!.id]==false) {
                  EconoCubite.get(context).addFav(model.product!.id);
                }
                else{
                  EconoCubite.get(context).delFav(model.product!.id);
                }
              },
              icon: Icon(
                Icons.favorite,
                size: 30.0,
                color: EconoCubite.get(context).isFav[model.product!.id]==true ?Colors.red :Colors.grey,
              ),
            )
          ],
        ),
      ));
}
