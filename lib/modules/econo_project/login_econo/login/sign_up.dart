// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// //import 'package:fluttertoast/fluttertoast.dart';
//
//
//
// class SigenUp extends StatefulWidget {
//   SigenUp({Key? key}) : super(key: key);
//
//   @override
//   State<SigenUp> createState() => _SigenUpState();
// }
//
// class _SigenUpState extends State<SigenUp> {
//   final _picker = ImagePicker();
//
//   File? _image;
//
//   String image64 = '';
//   String imageErrorMessage = '';
//
//   var formkay = GlobalKey<FormState>();
//
//   TextEditingController emailControler = TextEditingController();
//
//   TextEditingController passwordControler = TextEditingController();
//
//   TextEditingController firstControler = TextEditingController();
//
//   TextEditingController endControler = TextEditingController();
//
//   TextEditingController phoneControler = TextEditingController();
//
//   TextEditingController password1Controler = TextEditingController();
//
//   Future<void> _openImagePicker() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _image = File(pickedImage.path);
//         var bytes = _image?.readAsBytesSync();
//         image64 = base64.encode(bytes!);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => SignUpCubit(),
//       child: BlocConsumer<SignUpCubit, SignUpStates>(
//         listener: (context, state) {
//           if (state is Successtate) {
//             if (state.signup.status) {
//               print(state.signup.status);
//             } else {
//               print(state.signup.status);
//             }
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             resizeToAvoidBottomInset: true,
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Form(
//                     key: formkay,
//                     child: Container(
//                       padding: EdgeInsets.only(top: 40),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage("images/logen.jpg"),
//                             fit: BoxFit.cover),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text1(
//                             text: ',Hello',
//                             color: Colors.white,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text1(
//                             text: 'Creat Your Account',
//                             color: Colors.white,
//                           ),
//                           SizedBox(
//                             height: 270,
//                           ),
//                           Container(
//                             // height: 800,
//                             padding: EdgeInsets.only(bottom: 50),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(50),
//                                     topLeft: Radius.circular(50)),
//                                 color: Colors.white),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 20, left: 20, right: 20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text1(
//                                     font: 'BebasNeue Regular',
//                                     text: AppLocalizations.of(context).up1,
//                                     size: 35,
//                                     color: ColorApp.color1,
//                                   ),
//                                   SizedBox(height: 20),
//                                   Center(
//                                     child: TextButton(
//                                       onPressed: () {
//                                         _openImagePicker();
//                                       },
//                                       child: _image == null
//                                           ? CircleAvatar(
//                                               radius: 70.0,
//                                               backgroundImage: AssetImage(
//                                                   'images/avatar.png'),
//                                             )
//                                           : CircleAvatar(
//                                               radius: 70.0,
//                                               backgroundImage:
//                                                   FileImage(File(_image!.path)),
//                                             ),
//                                     ),
//                                   ),
//                                   Text(
//                                     imageErrorMessage.length > 0
//                                         ? imageErrorMessage
//                                         : "",
//                                     style: TextStyle(
//                                         fontSize: 13, color: Colors.red),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         flex: 1,
//                                         child: DefaultTextaField(
//                                           hint: AppLocalizations.of(context).up2,
//                                           validate1: (value) {
//                                             if (value!.isEmpty) {
//                                               return AppLocalizations.of(context).up12;
//                                             }
//                                             return null;
//                                           },
//                                           r: 30,
//                                           color1: ColorApp.color1,
//                                           color: Colors.grey[300],
//                                           size: 18,
//                                           sizeh: 10,
//                                           type: TextInputType.text,
//                                           controller: firstControler,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 8,
//                                       ),
//                                       Expanded(
//                                         flex: 1,
//                                         child: DefaultTextaField(
//                                           hint: AppLocalizations.of(context).up3,
//                                           validate1: (value) {
//                                             if (value!.isEmpty) {
//                                               return AppLocalizations.of(context).up13;
//                                             }
//                                             return null;
//                                           },
//                                           r: 30,
//                                           color1: ColorApp.color1,
//                                           color: Colors.grey[300],
//                                           size: 18,
//                                           sizeh: 20,
//                                           type: TextInputType.text,
//                                           controller: endControler,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                   DefaultTextaField(
//                                     hint: AppLocalizations.of(context).up4,
//                                     validate1: (value) {
//                                       if (value!.isEmpty) {
//                                         return AppLocalizations.of(context).up5;
//                                       }
//                                       return null;
//                                     },
//                                     r: 30,
//                                     color1: ColorApp.color1,
//                                     color: Colors.grey[300],
//                                     size: 18,
//                                     sizeh: 20,
//                                     type: TextInputType.emailAddress,
//                                     suffix: CupertinoIcons.person_fill,
//                                     controller: emailControler,
//                                   ),
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                   DefaultTextaField(
//                                       hint: AppLocalizations.of(context).up6,
//                                       r: 30,
//                                       color1: ColorApp.color1,
//                                       color: Colors.grey[300],
//                                       size: 18,
//                                       sizeh: 20,
//                                       obscure:
//                                           SignUpCubit.get(context).ispassword,
//                                       suffixPressed: () {
//                                         SignUpCubit.get(context)
//                                             .changpassword();
//                                       },
//                                       type: TextInputType.visiblePassword,
//                                       suffix: SignUpCubit.get(context).suffix,
//                                       controller: passwordControler,
//                                       validate1: (value) {
//                                         if (value!.isEmpty) {
//                                           return AppLocalizations.of(context).up7;
//                                         }
//                                         return null;
//                                       }),
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                   DefaultTextaField(
//                                       hint: AppLocalizations.of(context).up8,
//                                       r: 30,
//                                       color1: ColorApp.color1,
//                                       color: Colors.grey[300],
//                                       size: 18,
//                                       sizeh: 20,
//                                       obscure: true,
//                                       type: TextInputType.visiblePassword,
//                                       suffix:
//                                           CupertinoIcons.shield_lefthalf_fill,
//                                       controller: password1Controler,
//                                       validate1: (value) {
//                                         if (value!.isEmpty) {
//                                           return AppLocalizations.of(context).up9;
//                                         }
//                                         return null;
//                                       }),
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                   DefaultTextaField(
//                                       hint: AppLocalizations.of(context).up10,
//                                       r: 30,
//                                       color1: ColorApp.color1,
//                                       color: Colors.grey[300],
//                                       size: 18,
//                                       sizeh: 20,
//                                       type: TextInputType.phone,
//                                       suffix: CupertinoIcons.phone_fill,
//                                       controller: phoneControler,
//                                       validate1: (value) {
//                                         if (value!.isEmpty) {
//                                           return AppLocalizations.of(context).up11;
//                                         }
//                                         return null;
//                                       }),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                   DefaultButton(
//                                     color: ColorApp.color1,
//                                     text: AppLocalizations.of(context).up1,
//                                     font: 'BebasNeue Regular',
//                                     s: 25,
//                                     r: 30,
//                                     w: 150,
//                                     h: 50,
//                                     onTap: () {
//                                       if (image64 != '') {
//                                         if (formkay.currentState!.validate()) {
//                                           SignUpCubit.get(context).postData(
//                                             firstname: firstControler.text,
//                                             endtname: endControler.text,
//                                             email: emailControler.text,
//                                             image: image64,
//                                             password: passwordControler.text,
//                                             confPassword: password1Controler
//                                                 .text,
//                                             phone: int.parse(
//                                                 phoneControler.text),
//                                           );
//                                           print("image64${image64}");
//                                         }
//                                       }
//                                     else {
//                                         toast(mas: AppLocalizations.of(context).image, colors: Colors.red);
//                                       }
//
//                                       // if (emailControler.text.isEmpty ||
//                                       //     passwordControler.text.isEmpty ||
//                                       //     firstControler.text.isEmpty ||
//                                       //     endControler.text.isEmpty ||
//                                       //     phoneControler.text.isEmpty ||
//                                       //     password1Controler.text.isEmpty) {
//                                       //   Get.snackbar(
//                                       //       'Error Massege', 'Pleas fill in the fields',
//                                       //       backgroundColor: Colors.red[300],
//                                       //       snackPosition: SnackPosition.BOTTOM);
//                                       // } else if (emailControler.text.isNotEmpty &&
//                                       //     passwordControler.text.isNotEmpty &&
//                                       //     firstControler.text.isNotEmpty &&
//                                       //     endControler.text.isNotEmpty &&
//                                       //     phoneControler.text.isNotEmpty &&
//                                       //     password1Controler.text.isNotEmpty) {
//                                       //   Get.to(Home());
//                                       //   Get.snackbar(
//                                       //       'Wellcom', 'Account successfully created',
//                                       //       backgroundColor: ColorApp.color2,
//                                       //       snackPosition: SnackPosition.BOTTOM);
//                                       //
//                                       // }
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// /*   Fluttertoast.showToast(
//                          msg: state.signup.message,
//                          toastLength: Toast.LENGTH_SHORT,
//                          gravity: ToastGravity.CENTER,
//                          timeInSecForIosWeb: 5,
//                          backgroundColor: Colors.green,
//                          textColor: Colors.white,
//                          fontSize: 16.0
//                      );*/
//
// /*  Fluttertoast.showToast(
//                     msg:state.signup.message,
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.CENTER,
//                     timeInSecForIosWeb: 5,
//                     backgroundColor: Colors.red,
//                     textColor: Colors.white,
//                     fontSize: 16.0
//                 );*/
