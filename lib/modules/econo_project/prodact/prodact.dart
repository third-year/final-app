import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:firstflutterproject/models/econo_app/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/home_lyout/cubite/states.dart';

class ProdactScreen extends StatelessWidget {
  String selectstatus = 'new';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EconoCubite, EconoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: EconoCubite.get(context).homemodel != null,
          builder: (context) =>
              productsBilder(EconoCubite.get(context).homemodel, context),
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: strongColor,
          )),
        );
      },
    );
  }

  List<String> photocategories = [
    'https://cdn-icons-png.flaticon.com/512/4244/4244960.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJp6q0qm9R6GAArUQQZTDou5WsicfvS7W0-_KPJa0UzOjuNa7k0DFGPc0h1tYCSQdKIeY&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRjLz3kJ2-jsPbJqEAOePdvrxI23ZHaV3mXj0RKrofjJZqNHs3c2jhK2npyoTa0naT9ZI&usqp=CAU',
    'https://cdn-icons-png.flaticon.com/512/687/687263.png',
    'https://cdn-icons-png.flaticon.com/512/88/88746.png?w=360',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvSsgBRoWzXXIjBnaskRdOzDbooSHIPoNXhg&usqp=CAU',
    'https://static.vecteezy.com/system/resources/thumbnails/002/205/948/small/gift-box-icon-free-vector.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCkyIETUrVuFX-NqXCVzvXNb6c7098OpX45k6gZR9_YOR5DS7WqYfqZFE4Sk17rqo1sLw&usqp=CAU'
  ];

  List<String> categories = [
    'furniture',
    'accessories',
    'food',
    'clothes',
    'shoes',
    'books',
    'gifts',
    'technology',
  ];

  Widget productsBilder(HomeModel? model, context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Image(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/customers-fashion-shop-women-choosing-clothes-store-flat-vector-illustration-shopping-sale-retail-concept_74855-9836.jpg')),
                Image(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/shoppers-walking-past-fashion-outlet-window-customers-wheeling-cart-with-bags-packages-flat-vector-illustration-consumerism-purchase-concept_74855-10153.jpg?w=2000'))
              ],
              options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: midColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: EconoCubite.get(context).isDark
                    ? Color(0xFF333739)
                    : Colors.white,
                height: 190.0,
                width: double.infinity,
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1 / 1.0001,
                  children: List.generate(
                    categories.length,
                    (index) => Container(
                        color: Colors.black,
                        child: buildGridCategories(categories[index],
                            photocategories[index], index, context)),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 30.0),
            // Text1(text: 'status :', size: 18, fontWeight: FontWeight.w400),
            // SizedBox(
            //height: 10,
            // ),
            // DropdownButton(
            //     //padding:  EdgeInsets.only(left: 8.0),
            //     isExpanded: true,
            //     value: selectstatus,
            //     items: [
            //       DropdownMenuItem(child: Text('price'), value: 'price'),
            //       DropdownMenuItem(child: Text("rate"), value: "rate"),
            //     ],
            //     onChanged: (value) {
            //       selectstatus = value!;
            //       print(value);
            //     }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Products',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: midColor),
                    ),
                    //                 SizedBox(
                    //                   height: 10.0,
                    //                 ),
                    //               Text('order by',
                    // style: TextStyle(fontWeight: FontWeight.w400,
                    // fontSize: 15.0
                    // ),
                    //
                    // ),
                    //               DropdownButton(
                    //                   isExpanded: true,
                    //                   value: 'Rate',
                    //                   items: [
                    //                     DropdownMenuItem(child:Text('price') ,value: 'price'),
                    //                     DropdownMenuItem(child:Text('rate') ,value: 'rate),
                    //                   ],
                    //                   onChanged:(value){
                    //
                    //                       print(value);
                    //                     })
                  ]),
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
                childAspectRatio: 1 / 1.44,
                children:
                    List.generate(model!.data!.resultProducts!.length, (index) {
                  return buildGridProduct(
                      model.data!.resultProducts![index], context);
                }),
              ),
            )
          ],
        ),
      );
  Widget buildGridProduct(ProductsModel model, context) => GestureDetector(
      onTap: () {
        EconoCubite.get(context).gotoditels(model.id, context);
      },
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: AlignmentDirectional.bottomStart, children: [
            Image(
              image: MemoryImage(convertBase64Image(model.image.toString())),
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
                      onPressed: () {
                        if (EconoCubite.get(context).isFav[model.id] == false) {
                          EconoCubite.get(context).addFav(model.id);
                        } else {
                          EconoCubite.get(context).delFav(model.id);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30.0,
                        color: EconoCubite.get(context).isFav[model.id] == true
                            ? Colors.red
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ));
  Widget buildGridCategories(
          String catename, String catphoto, int index, context) =>
      GestureDetector(
        onTap: () {
          EconoCubite.get(context).gotocate(index, context, catename);
        },
        child: Container(
          color: EconoCubite.get(context).isDark
              ? Color(0xFF333739)
              : Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 27.0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                        '$catphoto',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                    child: Text(
                      '$catename',
                      style: TextStyle(
                          color: secondBackColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
