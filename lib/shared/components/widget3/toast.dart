import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
   Toast({Key? key,
  required this.text,
    this.colorbackground ,
    this.colorText,
    this.padding,
    this.sizeText,
  }) : super(key: key);
  String ?text;
  Color ?colorbackground;
  Color ?colorText;
  double ?sizeText;
  double ?padding;

  @override
  Widget build(BuildContext context) {
    return SnackBar(content:
    Text(text!,style: TextStyle(color:colorText,fontSize: sizeText ),),
        backgroundColor: colorbackground,
        padding:EdgeInsets.all(padding!),
      margin:EdgeInsets.only(bottom: 20) ,


    );
  }
}

class MySnackBar {
  static void show(BuildContext context, String message,  Color ?colorbackground,
  Color ?colorText,
  double ?sizeText,
  double ?padding,
      int time,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection:DismissDirection.down,
        elevation:20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Text(message ,style: TextStyle(color:colorText,fontSize: sizeText ),),
        duration: Duration(seconds: time),
        backgroundColor: colorbackground,
        padding:EdgeInsets.all(padding!),




      ),
    );
  }
}

/*Fluttertoast.showToast(
                    msg:state.signup.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );*/