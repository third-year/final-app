import 'dart:convert';
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Text1.dart';
import '../cubit_sign_up/cubit.dart';
import '../cubit_sign_up/states.dart';
import '../sign1.dart';

class SigenUp extends StatefulWidget {
  SigenUp({Key? key}) : super(key: key);

  @override
  State<SigenUp> createState() => _SigenUpState();
}

class _SigenUpState extends State<SigenUp> {
  var formkay = GlobalKey<FormState>();

  final _picker = ImagePicker();

  File? _image;

  String image64 = '';
  String imageErrorMessage = '';

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

  TextEditingController emailControler = TextEditingController();

  TextEditingController passwordControler = TextEditingController();

  TextEditingController firstControler = TextEditingController();

  TextEditingController endControler = TextEditingController();

  TextEditingController phoneControler = TextEditingController();

  TextEditingController password1Controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is Successtate) {
          if (state.signup.status) {
            print(state.signup.status);
          } else {
            print(state.signup.status);
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => sign1()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Form(
              key: formkay,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logen.jpg"), fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text1(
                      text: 'Hello,',
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text1(
                      text: 'Creat Your Account',
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 270,
                    ),
                    Container(
                      // height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                          color: Colors.white),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text1(
                              text: 'Sign Up',
                              size: 35,
                              color: strongColor,
                              font: 'BebasNeue Regular',
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  _openImagePicker();
                                },
                                child: _image == null
                                    ? CircleAvatar(
                                        radius: 70.0,
                                        backgroundImage:
                                            AssetImage('images/avatar.png'),
                                      )
                                    : CircleAvatar(
                                        radius: 70.0,
                                        backgroundImage:
                                            FileImage(File(_image!.path)),
                                      ),
                              ),
                            ),
                            Text(
                              imageErrorMessage.length > 0
                                  ? imageErrorMessage
                                  : "",
                              style: TextStyle(fontSize: 13, color: Colors.red),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: DefaultTextaField(
                                    hint: 'First Name',
                                    validate1: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Password';
                                      }
                                      return null;
                                    },
                                    r: 30,
                                    color1: strongColor,
                                    color: Colors.grey[300],
                                    size: 18,
                                    sizeh: 10,
                                    type: TextInputType.text,
                                    controller: firstControler,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DefaultTextaField(
                                    hint: 'End Name',
                                    validate1: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Password';
                                      }
                                      return null;
                                    },
                                    r: 30,
                                    color1: strongColor,
                                    color: Colors.grey[300],
                                    size: 18,
                                    sizeh: 20,
                                    type: TextInputType.text,
                                    controller: endControler,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            DefaultTextaField(
                              hint: 'Email',
                              validate1: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                return null;
                              },
                              r: 30,
                              color1: strongColor,
                              color: Colors.grey[300],
                              size: 18,
                              sizeh: 20,
                              type: TextInputType.emailAddress,
                              suffix: CupertinoIcons.person_fill,
                              controller: emailControler,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            DefaultTextaField(
                                hint: 'Password',
                                r: 30,
                                color1: strongColor,
                                color: Colors.grey[300],
                                size: 18,
                                sizeh: 20,
                                obscure: SignUpCubit.get(context).ispassword,
                                suffixPressed: () {
                                  SignUpCubit.get(context).changpassword();
                                },
                                type: TextInputType.visiblePassword,
                                suffix: SignUpCubit.get(context).suffix,
                                controller: passwordControler,
                                validate1: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 8,
                            ),
                            DefaultTextaField(
                                hint: 'Confirm Password',
                                r: 30,
                                color1: strongColor,
                                color: Colors.grey[300],
                                size: 18,
                                sizeh: 20,
                                obscure: true,
                                type: TextInputType.visiblePassword,
                                suffix: CupertinoIcons.shield_lefthalf_fill,
                                controller: password1Controler,
                                validate1: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 8,
                            ),
                            DefaultTextaField(
                                hint: 'Phone',
                                r: 30,
                                color1: strongColor,
                                color: Colors.grey[300],
                                size: 18,
                                sizeh: 20,
                                type: TextInputType.phone,
                                suffix: CupertinoIcons.phone_fill,
                                controller: phoneControler,
                                validate1: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                                // ignore: unnecessary_null_comparison
                                condition: state is! SignUpLodingState,
                                builder: (context) => DefaultButton(
                                      color: strongColor,
                                      font: 'BebasNeue Regular',
                                      text: 'Sign Up',
                                      s: 25,
                                      r: 30,
                                      w: 150,
                                      h: 50,
                                      onTap: () {
                                        if (formkay.currentState!.validate() &&
                                            image64 != '') {
                                          SignUpCubit.get(context).postData(
                                              firstname: firstControler.text,
                                              endtname: endControler.text,
                                              email: emailControler.text,
                                              password: passwordControler.text,
                                              confPassword:
                                                  password1Controler.text,
                                              phone: int.parse(
                                                  phoneControler.text),
                                              image: this.image64);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => sign1()),
                                          );
                                        }

                                        // if (emailControler.text.isEmpty ||
                                        //     passwordControler.text.isEmpty ||
                                        //     firstControler.text.isEmpty ||
                                        //     endControler.text.isEmpty ||
                                        //     phoneControler.text.isEmpty ||
                                        //     password1Controler.text.isEmpty) {
                                        //   Get.snackbar(
                                        //       'Error Massege', 'Pleas fill in the fields',
                                        //       backgroundColor: Colors.red[300],
                                        //       snackPosition: SnackPosition.BOTTOM);
                                        // } else if (emailControler.text.isNotEmpty &&
                                        //     passwordControler.text.isNotEmpty &&
                                        //     firstControler.text.isNotEmpty &&
                                        //     endControler.text.isNotEmpty &&
                                        //     phoneControler.text.isNotEmpty &&
                                        //     password1Controler.text.isNotEmpty) {
                                        //   Get.to(Home());
                                        //   Get.snackbar(
                                        //       'Wellcom', 'Account successfully created',
                                        //       backgroundColor: ColorApp.color2,
                                        //       snackPosition: SnackPosition.BOTTOM);
                                        //
                                        // }
                                      },
                                    ),
                                fallback: (context) =>
                                    CircularProgressIndicator(
                                      color: strongColor,
                                    )),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*   Fluttertoast.showToast(
                         msg: state.signup.message,
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.CENTER,
                         timeInSecForIosWeb: 5,
                         backgroundColor: Colors.green,
                         textColor: Colors.white,
                         fontSize: 16.0
                     );*/

/*  Fluttertoast.showToast(
                    msg:state.signup.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );*/
