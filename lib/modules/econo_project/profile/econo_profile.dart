import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EconoProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ProfileCubit.get(context).profilemodel != null,
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Profile'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 30.0,
                        color: secondBackColor,
                        fontWeight: FontWeight.w500)),
                actions: [
                  Icon(
                    Icons.person,
                    color: secondBackColor,
                    size: 40.0,
                  )
                ],
                elevation: 0.0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 100.0,
                            backgroundImage: MemoryImage(convertBase64Image(
                                ProfileCubit.get(context)
                                    .profilemodel!
                                    .user!
                                    .image
                                    .toString()))),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                      color: firstBackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23.0),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                Text(
                                  ProfileCubit.get(context)
                                      .profilemodel!
                                      .user!
                                      .fullName
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          width: double.infinity,
                          height: 70.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Email :',
                                  style: TextStyle(
                                      color: firstBackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23.0),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                Text(
                                  ProfileCubit.get(context)
                                      .profilemodel!
                                      .user!
                                      .email
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          width: double.infinity,
                          height: 70.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Phone :',
                                  style: TextStyle(
                                      color: firstBackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23.0),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                Text(
                                  ProfileCubit.get(context)
                                      .profilemodel!
                                      .user!
                                      .phone
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          width: double.infinity,
                          height: 70.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Wallet :',
                                  style: TextStyle(
                                      color: firstBackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23.0),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                Text(
                                  ProfileCubit.get(context)
                                      .profilemodel!
                                      .user!
                                      .wallet
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          width: double.infinity,
                          height: 70.0,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        DefaultButton(
                            onTap: () {
                              ProfileCubit.get(context).edite(context);
                            },
                            text: 'edit profile'.toUpperCase(),
                            s: 20.0,
                            color: strongColor,
                            w: 180.0)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: strongColor,
            )),
          );
        });
  }
}
