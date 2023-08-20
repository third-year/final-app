import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../layout/home_lyout/cubite/cubite.dart';
import '../../../layout/home_lyout/cubite/states.dart';
import '../../../models/econo_app/home_model.dart';
import '../../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EconoCubite, EconoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: Text('Search',style:TextStyle(
                fontSize: 30.0,
                color: secondBackColor,
                fontWeight: FontWeight.w500)),),

            body: SingleChildScrollView(
              child: Column(children: [
                defaultFormField(
                  controller: searchcontroller,

                  type: TextInputType.text,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a name to search';
                    }
                    return null;
                  },
                  label: 'enter product name',
                  onSubmit: (value) {
                    EconoCubite.get(context).getsearch(searchcontroller.text);
                    },
                    prefix: Icons.search,),
                    SizedBox(height: 30.0,),
                    ConditionalBuilder(
                      condition: EconoCubite
                          .get(context)
                          .resultname != [],
                      builder: (context) {
                         return EconoCubite.get(context).resultname!=[]?buildSearchProduct(EconoCubite
                              .get(context)
                              .resultname,context)
                             :Text('no result found',style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.w400
                         ),) ;
                      },
                      fallback: (context) =>
                          Center(
                              child: CircularProgressIndicator(
                              color: strongColor,
                              ),),),
                SizedBox(height: 40.0,),

              ],),
            )
        );
      },
    );
  }
  Widget buildSearchProduct(List<ProductsModel> resultname,context) =>
    Container(
      color:EconoCubite.get(context).isDark? Color(0xFF333739):Colors.white,
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        childAspectRatio: 1 / 1.44,
        children: List.generate(
            resultname.length,
                (index) {
              return buildGridProduct(
                 resultname[index],context);
            }),
      ),
    );


    Widget buildGridProduct(ProductsModel model,context) => GestureDetector(
        onTap:() {
          EconoCubite.get(context).gotoditels(model.id,context);
        },
    child: Container(
    color:EconoCubite.get(context).isDark? Color(0xFF333739):Colors.white,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Stack(alignment: AlignmentDirectional.bottomStart, children: [
    Image(
    image:MemoryImage(
        convertBase64Image(
        ProfileCubit.get(context).profilemodel!.user!.image.toString())),
    width: double.infinity,
    fit: BoxFit.cover,
    height: 200,
    )
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
    onPressed: () {
    if(EconoCubite.get(context).isFav[model.id]==false) {
    EconoCubite.get(context).addFav(model.id);
    }
    else{
    EconoCubite.get(context).delFav(model.id);
    }
    },
    icon: Icon(
    Icons.favorite,
    size: 30.0,
    color: EconoCubite.get(context).isFav[model.id]==true ?Colors.red :Colors.grey,
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
