import 'dart:convert';
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EconoEditeProfileScreen extends StatefulWidget {
  @override
  State<EconoEditeProfileScreen> createState() =>
      _EconoEditeProfileScreenState();
}

class _EconoEditeProfileScreenState extends State<EconoEditeProfileScreen> {
  var phonecontroller = TextEditingController();

  var fullnamecontroller = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! ProfileEditeLoadingState,
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Edit Profile'.toUpperCase(),
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
              body: Form(
                key: formkay,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
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
                                          AssetImage('images/avatar.png'),
                                    )
                                  : CircleAvatar(
                                      radius: 60.0,
                                      backgroundImage:
                                          FileImage(File(_image!.path)),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          DefaultTextaField(
                            hint: 'FullName',
                            size: 26.0,
                            color: lightColor,
                            color1: Colors.white,
                            suffix: Icons.edit,
                            controller: fullnamecontroller,
                            validate1: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your new name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          DefaultTextaField(
                            hint: 'Phone',
                            size: 26.0,
                            color: lightColor,
                            color1: Colors.white,
                            suffix: Icons.edit,
                            controller: phonecontroller,
                            validate1: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter your new phone';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          DefaultButton(
                              onTap: () {
                                if (formkay.currentState!.validate() &&
                                    image64 != '') {
                                  ProfileCubit.get(context).update(
                                      phone: phonecontroller.text,
                                      fullName: fullnamecontroller.text,
                                      context: context);
                                }
                              },
                              text: 'edit'.toUpperCase(),
                              s: 20.0,
                              color: strongColor,
                              w: 250.0),
                          SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                              onTap: () {
                                ProfileCubit.get(context).toChangePass(context);
                              },
                              text: 'change Password'.toUpperCase(),
                              s: 20.0,
                              color: strongColor,
                              w: 250.0)
                        ],
                      ),
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
