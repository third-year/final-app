// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../Text1.dart';
// import '../../../../constant.dart';
// import '../../../../new_things/widget3/toast.dart';
// import '../../../../shared/components/constants.dart';
// import '../../../../shared/network/local/cache_helper.dart';
// import '../../add_product/add_product.dart';
// import '../../sign_up/sign_up.dart';
// import '../login_cubit/cubit.dart';
// import '../login_cubit/states.dart';
// import 'passwordforget.dart';
//
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// class sign extends StatelessWidget {
//   bool passwordvisibale = false;
//   var emailcontroller = TextEditingController();
//   var passwordcontroller = TextEditingController();
//   var formkay = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ELoginCubit, ELoginSates>(listener: (context, state) {
//       if (state is LoginSuccessState) {
//         if (state.loginModel!.status == 'success') {
//           CacheHelper.saveData(key: 'password', value: passwordcontroller.text);
//           print(state.loginModel!.token);
//           CacheHelper.savetoken(
//                   key: 'token', value: state.loginModel!.token.toString())
//               .then((value) {
//             print('save token');
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => add_product(),
//                 ));
//             token = state.loginModel!.token.toString();
//           });
//           token = state.loginModel!.token.toString();
//         } else
//           print(state.loginModel!.status);
//       }
//       if (state is LoginErrorState) {
//         toast(mas: AppLocalizations.of(context).enter, colors: Colors.red);
//       }
//     }, builder: (context, state) {
//       return Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Container(
//             constraints: BoxConstraints(),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/11.jpg'),
//                     fit: BoxFit.cover)),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 400.0),
//               child: Container(
//                 height: 480,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formkay,
//                     child: Column(children: [
//                       Text1(
//                         text: AppLocalizations.of(context).log1,
//                         font: 'BebasNeue Regular',
//                         color: Color(0xFF439A97),
//                         fontWeight: FontWeight.bold,
//                         size: 35,
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//
//                       DefaultTextaField(
//                         hint: AppLocalizations.of(context).log2,
//                         icon: Icons.person,
//                         color: Colors.grey[300],
//                         controller: emailcontroller,
//                         color1: Color(0xFF439A97),
//                         size: 18,
//                         validate1: (value) {
//                           if (value == null || value.isEmpty) {
//                             return AppLocalizations.of(context).log3;
//                           }
//                           return null;
//                         },
//                       ),
//
//                       SizedBox(
//                         height: 10,
//                       ),
//                       DefaultTextaField(
//                         hint: AppLocalizations.of(context).log4,
//                         // icon: Icons.lock,
//                         color: Colors.grey[300],
//                         controller: passwordcontroller,
//                         color1: Color(0xFF439A97),
//                         size: 18,
//                         // obscure: true,
//                         validate1: (value) {
//                           if (value == null || value.isEmpty) {
//                             return AppLocalizations.of(context).log5;
//                           }
//                           return null;
//                         },
//                         obscure: ELoginCubit.get(context).ispassword,
//                         suffixPressed: () {
//                           ELoginCubit.get(context).changpassword();
//                         },
//                         type: TextInputType.visiblePassword,
//                         suffix: ELoginCubit.get(context).suffix,
//                       ),
//
//                       SizedBox(
//                         height: 25,
//                       ),
//                       ConditionalBuilder(
//                         condition: state is! LoginLoadingState,
//                         builder: (context) => DefaultButton(
//                             text: AppLocalizations.of(context).log9,
//                             font: 'BebasNeue Regular',
//                             color: Color(0xFF439A97),
//                             s: 30,
//                             r: 30,
//                             onTap: () {
//                               if (formkay.currentState!.validate()) {
//                                 ELoginCubit.get(context).userlogin(
//                                     email: emailcontroller.text,
//                                     password: passwordcontroller.text);
//
//                                 print('yas');
//                               }
//                               ;
//                             }),
//                         fallback: (context) => Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       ),
//
//                       SizedBox(height: 15),
//
//                       Column(
//                         children: [
//                           Row(
// //                                crossAxisAlignment: CrossAxisAlignment.start,
//
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               textbutton(
//                                 text: AppLocalizations.of(context).log6,
//                                 color: Color(0xFF085F63),
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => passwordForget()),
//                                   );
//
//                                   return print('sign ');
//                                 },
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(AppLocalizations.of(context).log7,
//                                   style: Theme.of(context).textTheme.bodyLarge),
//                               textbutton(
//                                 text: AppLocalizations.of(context).log8,
//                                 color: Color(0xFF085F63),
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => SigenUp()),
//                                   );
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//
// //439A97
//                     ]),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30))),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
