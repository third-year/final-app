import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:readmore/readmore.dart';

import '../../../Text1.dart';
import '../../../constant.dart';
import '../../../models/econo_app/getRivewModel.dart';
import '../../../models/econo_app/modelDetails.dart';
import 'ditels_cubite/cubit_details.dart';
import 'ditels_cubite/statesDetails.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController RiveewControler = TextEditingController();

  double? ratingControler = 1;

  late Position L;
  late Position L1;
  int counter = 1;

  List Address = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, DitailsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = DetailsCubit.get(context);
        return ConditionalBuilder(
          condition: DetailsCubit.get(context).getRivewModel != null,
          builder: (context) => DetailsScreen(
              DetailsCubit.get(context).detailsModel,
              context,
              DetailsCubit.get(context).getRivewModel),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget DetailsScreen(
          DetailsModel? model, context, GetRivewModel? getRivewModel) =>
      Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 450,
                  width: double.infinity,
                  //padding: EdgeInsets.only(top: 60),
                  child: Image(
                    image: MemoryImage(convertBase64Image(
                        model!.data!.product!.image.toString())),
                    fit: BoxFit.fill,
                  )),
              Stack(
                children: [
                  Container(
                    height: 1000,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                        color: Colors.grey[200]),
                    child: Padding(
                      key: const Key('showMore'),
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text1(
                                text: '${model!.data!.product!.name}',
                                size: 28,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                  ignoreGestures: true,
                                  itemCount: 5,
                                  initialRating: model
                                      .data!.product!.ratingsAverage!
                                      .toDouble(),
                                  minRating: 1,
                                  itemSize: 20,
                                  direction: Axis.horizontal,
                                  itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                  onRatingUpdate: (value) {}),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                CupertinoIcons.location,
                                color: Colors.grey[500],
                                size: 15,
                              ),
                              Text1(
                                  text:
                                      '${model.data!.product!.addressInWords!.country + '/' + model.data!.product!.addressInWords!.city}',
                                  size: 15,
                                  color: Colors.grey[500]),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.money_dollar,
                                color: strongColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text1(
                                text: '${model!.data!.product!.price}',
                                size: 15,
                                color: strongColor,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                CupertinoIcons.arrow_up_arrow_down_circle,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text1(
                                text: '${model!.data!.product!.status}',
                                size: 15,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                CupertinoIcons.bag_fill,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text1(
                                  text: '${model!.data!.product!.quantity}',
                                  size: 15,
                                  color: Colors.red),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                CupertinoIcons.text_justify,
                                color: Colors.blue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text1(
                                text: '${model!.data!.product!.category}',
                                size: 15,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text1(
                            text: 'description',
                            size: 20,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: ReadMoreText(
                              '${model!.data!.product!.description}',
                              trimLines: 2,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              colorClickableText: Colors.black87,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              lessStyle: TextStyle(color: strongColor),
                              moreStyle: TextStyle(color: strongColor),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text1(
                                text: 'Review',
                                size: 20,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                CupertinoIcons.bubble_left_bubble_right,
                                size: 20,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 400,
                            padding: EdgeInsets.all(10),
                            color: Colors.grey[300],
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => GetRivews(
                                    getRivewModel!.data!.reviews[index]),
                                separatorBuilder: (context, index) => Divider(
                                      endIndent: 6,
                                      height: 20,
                                      thickness: 1,
                                      color: Colors.grey[500],
                                    ),
                                itemCount: getRivewModel!.data!.reviews.length),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              cursorColor: strongColor,
                              cursorHeight: 20,
                              style: TextStyle(
                                color: strongColor,
                                fontSize: 15,
                              ),
                              controller: RiveewControler,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: midColor),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15, right: 15),
                                  hintText: 'Whrit the comment here',
                                  hintStyle:
                                      TextStyle(color: Colors.blueGrey[200]),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.send),
                                    color: Colors.blueGrey[200],
                                    onPressed: () {
                                      DetailsCubit.get(context).postData(
                                          review: RiveewControler.text,
                                          rating: ratingControler);
                                      print(RiveewControler);
                                      print(ratingControler);
                                    },
                                  ))),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text1(
                                text: 'Rating prodact here:',
                                color: Colors.black87,
                                size: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RatingBar.builder(
                                  itemCount: 5,
                                  initialRating: ratingControler as double,
                                  minRating: 1,
                                  itemSize: 20,
                                  direction: Axis.horizontal,
                                  itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                  onRatingUpdate: (value) {
                                    setState(() {
                                      ratingControler = value;
                                    });
                                    // value = ratingControler  ;
                                    //ratingControler = value ;
                                    print(value);
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: strongColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    DetailsCubit.get(context).add();
                                  },
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                    color: strongColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text1(
                                  text: '${DetailsCubit.get(context).counter}',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    DetailsCubit.get(context).minuis();
                                  },
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                    color: strongColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        DefaultButton(
                          color: strongColor,
                          text: 'Add in your card',
                          onTap: () async {
                            getlocation();
                            L1 = await getlocat();
                            Address.add(L1.latitude);
                            Address.add(L1.longitude);

                            DetailsCubit.get(context).postQuintity(
                              destinationAddress: Address,
                              context: context,
                              quantitySell:
                                  DetailsCubit.get(context).counter.toInt(),
                            );

                            print(DetailsCubit.get(context).counter);
                          },
                          icon: CupertinoIcons.cart,
                          s: 15,
                          w: 170,
                        ),
                      ],
                    ),
                    bottom: 30,
                    right: 20,
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget GetRivews(reviewsModel model1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text1(
                text: '${model1.user!.fullName}',
                color: Colors.black87,
                size: 15,
              ),
              SizedBox(
                width: 20,
              ),
              /*  Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.amber)

              ),
              child: Row(
                children: [
                  Text1(text: '${model1.rating}',color: Colors.amber[600],size: 15,),
                  Icon(Icons.star,color: Colors.amber[600],size:15,)
                ],
              ),
            ),*/

              RatingBar.builder(
                ignoreGestures: true,
                itemCount: 5,
                initialRating: model1.rating.toDouble(),
                minRating: 1,
                itemSize: 10,
                direction: Axis.horizontal,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          ReadMoreText(
            '${model1.review}',
            trimLines: 2,
            style: TextStyle(color: Colors.grey, fontSize: 15),
            colorClickableText: Colors.black87,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            lessStyle: TextStyle(color: strongColor),
            moreStyle: TextStyle(color: strongColor),
          ),
        ],
      );
///////////////////////تحديد الموقع
  /*getlocation() async {
    bool service;
    LocationPermission permission;
    service= await Geolocator.isLocationServiceEnabled();
    if (!service){
      AlertDialog(title: Text('Pleas open GPS'),);
    }
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always){
      getlocat();

    }
  }

  Future<Position> getlocat()async{
    Position? po=  await Geolocator.getCurrentPosition().then((value) => value);
    //Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)

    setState(() {
      L = po!;
    });
    // return await Geolocator.getCurrentPosition().then((value) => value);
    return L;
  }*/

  getlocation() async {
    bool service;
    LocationPermission permission;
    service = await Geolocator.isLocationServiceEnabled();
    if (!service) {
      AlertDialog(
        title: Text('Pleas open GPS'),
      );
    }
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always) {
      getlocat();
    }
  }

  Future<Position> getlocat() async {
    Position? po = await Geolocator.getCurrentPosition().then((value) => value);
    //Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)

    setState(() {
      L = po!;
    });
    // return await Geolocator.getCurrentPosition().then((value) => value);
    return L;
  }
}

/*
*/
