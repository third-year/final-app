import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../login_econo/login/passwordforget.dart';

class ChangePasswordScreen extends StatelessWidget {
  var oldpasscontroller = TextEditingController();
  var newpasscontroller = TextEditingController();
  var passconfcontroller = TextEditingController();
  var formkay = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          password1=CacheHelper.getData(key: 'password1');
          password1=newpasscontroller.text;
        print(password1.toString());
        },
    builder: (context, state) {
      return ConditionalBuilder(
          condition:state is! ProfileEditePassLoadingState,
          builder: (context) =>
              Scaffold(
                  appBar: AppBar(
                    title: Text('ChangePassword'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 30.0,
                            color: secondBackColor,
                            fontWeight: FontWeight.w500)),
                    actions: [
                      Icon(
                        Icons.password,
                        color: secondBackColor,
                        size: 40.0,
                      )
                    ],
                    elevation: 0.0,
                  ),
                  body: Form(
                      key: formkay,
                      child: Center(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text('Pleas Enter Your Old Password',
                                            style:  Theme.of(context).textTheme.headlineSmall,),
                                        ),
                                        SizedBox(
                                          height: 40.0,
                                        ),
                                        DefaultTextaField(
                                          hint: 'old password',
                                          size: 26.0,
                                          color: lightColor,
                                          color1: Colors.white,
                                          suffix: Icons.lock_clock_rounded,
                                          controller: oldpasscontroller,
                                          validate1: (value) {
                                            if (value == null ||value.isEmpty ) {
                                              return 'password is not true';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 20.0,),
                                        DefaultButton(
                                            onTap: () {
                                              if (formkay.currentState!.validate()) {
                                                ProfileCubit.get(context).shownewpass();
                                                print(ProfileCubit.get(context).show.toString());
                                              };
                                              print(password1);
                                              print(oldpasscontroller.value.text);
                                              },
                                            text: 'next'.toUpperCase(),
                                            s: 20.0,
                                            color: strongColor,
                                            w: 250.0),
                                        SizedBox(height: 20.0,),
                                        ProfileCubit.get(context).show==true?DefaultTextaField(
                                          hint: 'new password',
                                          size: 26.0,
                                          color: lightColor,
                                          color1: Colors.white,
                                          suffix: Icons.lock,
                                          controller: newpasscontroller,
                                          validate1: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return ' enter your new password';
                                            }
                                            return null;
                                          },
                                        ):SizedBox(),
                                        ProfileCubit.get(context).show==true?SizedBox(height: 20.0,):SizedBox(),
                                        ProfileCubit.get(context).show==true?DefaultTextaField(
                                          hint: 'confirm password',
                                          size: 26.0,
                                          color: lightColor,
                                          color1: Colors.white,
                                          suffix: Icons.lock_reset,
                                          controller: passconfcontroller,
                                          validate1: (value) {
                                            if (value == null ||
                                                value.isEmpty||passconfcontroller.text!=newpasscontroller.text) {
                                              return ' enter your new password again';
                                            }
                                           return null;
                                          },
                                        ):SizedBox(),
                                        ProfileCubit.get(context).show==true?SizedBox(height: 30.0,):SizedBox(),
                                        ProfileCubit.get(context).show==true?DefaultButton(
                                            onTap: () {
                                               if (formkay.currentState!.validate()) {
                                                ProfileCubit.get(context).updatepass(
                                                   newpass: newpasscontroller.text,
                                                    oldpass: oldpasscontroller.text,
                                                    confpass: passconfcontroller.text,
                                                    context: context
                                                );
                                              }
                                            }, text: 'edite'.toUpperCase(),
                                            s: 20.0,
                                            color: strongColor,
                                            w: 250.0):SizedBox(),
                                        SizedBox(height: 30.0),
                                        textbutton(text: 'forget password?',
                                          color: Color(0xFF085F63),
                                          onTap: () {
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  passwordForget()),);
                                            },),
                                      ]
                                  )
                              )
                          )
                      )
                  )
              ), fallback: (BuildContext context) =>
          Center(
              child: CircularProgressIndicator(
                color: strongColor,
              )
          )
      );
    }
    );
    }
    }
