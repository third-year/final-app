import 'dart:convert';
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/modules/econo_project/add_product/state_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant.dart';
import '../../../layout/home_lyout/home_lyout.dart';
import '../../../new_things/widget3/toast.dart';
import 'cubit_product.dart';

class add_product extends StatefulWidget {
  @override
  State<add_product> createState() => _add_productState();
}

class _add_productState extends State<add_product> {
  //const add({super.key});
  var nameproduct = TextEditingController();
  var description_product = TextEditingController();
  var price_product = TextEditingController();
  var quantity_product = TextEditingController();
  var formkay = GlobalKey<FormState>();
  late Position L;
  late Position LL;

  final _picker = ImagePicker();

  File? _image;

  String image64 = '';
  String imageErrorMessage = '';

  List address1 = [];
  String selectgetcategory = 'food';
  String selectstatus = 'new';

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        var bytes = _image?.readAsBytesSync();
        image64 = base64.encode(bytes!);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => product_cubit(),
        child: BlocConsumer<product_cubit, state_product>(
          listener: (context, state) {
            if (state is productSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeLyoutScreen()),
                  (route) => false);
            }
          },
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.insert_drive_file,
                        size: 35.0,
                      ),
                      color: strongColor,
                    ),
                  ],
                  title: Text('Add Product'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 30.0,
                          color: secondBackColor,
                          fontWeight: FontWeight.w500)),
                  elevation: 0.0,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.grey[190],
                      child: Form(
                        key: formkay,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  _openImagePicker();
                                },
                                child: _image == null
                                    ? CircleAvatar(
                                        radius: 70.0,
                                        backgroundImage:
                                            AssetImage('images/product.jpg'),
                                      )
                                    : CircleAvatar(
                                        radius: 60.0,
                                        backgroundImage:
                                            FileImage(File(_image!.path)),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'product',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTextaField(
                              hint: '',
                              color: Colors.white,
                              r: 0,
                              type: TextInputType.text,
                              controller: nameproduct,
                              validate1: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('description',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTextaField(
                              hint: '',
                              color: Colors.white,
                              r: 0,
                              type: TextInputType.text,
                              controller: description_product,
                              validate1: (value) {
                                if (value == null || value.isEmpty) {
                                  return ' ';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('price',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTextaField(
                              hint: '',
                              color: Colors.white,
                              r: 0,
                              type: TextInputType.number,
                              controller: price_product,
                              validate1: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('quantity',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTextaField(
                              hint: '',
                              color: Colors.white,
                              r: 0,
                              type: TextInputType.number,
                              controller: quantity_product,
                              validate1: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('category',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButton(
                                isExpanded: true,
                                value: selectgetcategory,
                                items: [
                                  //getcategory().toList(),
                                  DropdownMenuItem(
                                      child: Text('furniture'),
                                      value: "furniture"),
                                  DropdownMenuItem(
                                      child: Text('accessories'),
                                      value: "accessories"),
                                  DropdownMenuItem(
                                      child: Text('food'), value: "food"),
                                  DropdownMenuItem(
                                      child: Text('clothes'), value: "clothes"),
                                  DropdownMenuItem(
                                      child: Text('shoes'), value: "shoes"),
                                  DropdownMenuItem(
                                      child: Text('gifts'), value: "gifts"),
                                  DropdownMenuItem(
                                      child: Text('books'), value: "books"),
                                  DropdownMenuItem(
                                      child: Text('technology'),
                                      value: "technology"),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectgetcategory = value!;
                                    print(value);
                                  });
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('status',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButton(
                                // padding:  EdgeInsets.only(left: 8.0),
                                isExpanded: true,
                                value: selectstatus,
                                items: [
                                  DropdownMenuItem(
                                      child: Text('newstate'), value: 'new'),
                                  DropdownMenuItem(
                                      child: Text('old'), value: "old"),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectstatus = value!;
                                    print(value);
                                  });
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: DefaultButton(
                                onTap: () async {
                                  await getlocation();
                                  toast(
                                      mas:
                                          'your location is ready you can add your product now',
                                      colors: Colors.red);
                                  print(' llll =${L.longitude}');
                                  print(' llll =${L.latitude}');
                                },
                                text: 'press to get your location',
                                w: 300,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: ConditionalBuilder(
                                condition: state is! productLoadState,
                                builder: (context) => DefaultButton(
                                    text: 'addproduct',
                                    color: Color(0xFF439A97),
                                    s: 20,
                                    r: 30,
                                    w: 200,
                                    onTap: () async {
                                      LL = await getlocat();

                                      address1.add(LL.latitude);
                                      address1.add(LL.longitude);
                                      if (image64 != '') {
                                        if (formkay.currentState!.validate()) {
                                          print(L.longitude);

                                          product_cubit
                                              .product(context)
                                              .addproduct(
                                                name: nameproduct.text,
                                                price: int.parse(
                                                    price_product.text),
                                                quantity: int.parse(
                                                    quantity_product.text),
                                                category: selectgetcategory
                                                    .toString(),
                                                status: selectstatus.toString(),
                                                description:
                                                    description_product.text,
                                                image: image64,
                                                address: address1,
                                              );
                                        }
                                        ;
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeLyoutScreen()),
                                            (route) => false);
                                      }
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           SalesScreen()),
                                      // );
                                      // toast(mas: 'image', colors: Colors.red);
                                    }),
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        ));
  }

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
  //   permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();

  // }

  // List<DropdownMenuItem<String>> getcategory(){
  //   List<String> categories=[
  //     "furniture",
  //     "accessories",
  //     "food",
  //     // "clothes",
  //     // "shoes",
  //     // "books",
  //     // "gifts",
  //     // "technology",
  //   ];
  //  final List<DropdownMenuItem<String>> dropdownitem =[];
  //   int i;
  //   for ( i=0 ; i<=categories.length; i++){
  //      String category=categories[i];
  //   var newitem=DropdownMenuItem(child:Text(category) ,value: category,);
  //      dropdownitem.add(newitem);
  //   }
  //   return  dropdownitem;
  //
  //
  // }
}
