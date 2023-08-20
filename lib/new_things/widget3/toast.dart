import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


  void toast({required String mas,
  required Color colors}) {
    Fluttertoast.showToast(
        msg: mas,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.grey,

        textColor:Colors.white ,
        fontSize: 16
    );
  }
