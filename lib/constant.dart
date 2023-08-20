import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

const Color firstBackColor = Color(0xff193C32);
const Color secondBackColor = Color(0xff276443);
const Color thirdBackColor = Color(0xff1AF1A4);
const Color buttonColor = Color(0xffEDDDB0);
const Color appbarcolor = Color(0xffF28D8D);
const Color textform =Color(0xffbd7bd7);
const Color iconcolor =Color(0xff0f6131);
const Color timecolor=Color(0xBA09752E);
const Color endtimecolor=Color(0xFF3A7893);
const Color buttonbarColor = Color(0xffd2cfcf);
const Color gredColor = Color(0xbdd9d5d5);
const Color strongColor = Color(0xff439a97);
const Color midColor = Color(0xff62b6b7);
const Color lightColor = Color(0xff97dece);
const Color verylightColor = Color(0xffcbedd5);
const Color veryverylightColor = Color(0xfff0fffa);

const BoxDecoration gradientBack = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [firstBackColor, secondBackColor, thirdBackColor],
  ),
);
void printFullText(String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


class DefaultTextaField extends StatelessWidget {
  DefaultTextaField(
      {Key? key,
        required this.hint,
        this.color = Colors.grey,
        this.r = 30,
        this.icon,
        this.color1 = Colors.black87,
        this.size,
        this.sizeh,
        this.type,
        this.obscure = false,
        this.controller,
        this.validate1,
        this.suffix,
        this.font='Mulish Medium',
        this.suffixPressed})
      : super(key: key);
  final String? Function(String?)? validate1;
  final void Function() ?suffixPressed;
  Color? color;
  Color? color1;
  String hint;
  String?font;
  IconData? icon;
  double? r;
  double? size;
  double? sizeh;
  TextInputType? type;
  bool obscure;
  TextEditingController? controller;
  IconData? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      // لون خط الكتابة وارتفاعه
      cursorColor: color1,
      cursorHeight: sizeh,
      style: TextStyle(
        //لون الكتابة وحجمها
        color: color1,
        fontSize: size,
      ),
      decoration: InputDecoration(
          isDense: false,
          focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          contentPadding:
          EdgeInsets.only(left: 30, top: 15, bottom: 15, right: 30),
          //لون المستطيل كامل
          filled: true,
          fillColor: color,
          //focusColor: color,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(r!),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: color1),
          labelStyle: TextStyle(color: color1),
          suffixIcon: suffix != null
              ? IconButton(
            icon: Icon(
              suffix,
              color: color1,
            ),
            onPressed: suffixPressed,
          )
              : null,
          suffixIconColor: color1),

      validator: validate1,
    );
    ;
  }}

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
        required this.onTap,
        this.h = 60,
        this.w = 120,
        this.r = 20,
        this.s = 16,
        this.color = Colors.indigo,
        this.text = '',
        this.textColor = Colors.white,
        this.icon,
this.font='Mulish Medium',
      })
      : super(key: key);
  final void Function() onTap;
  double h;
  double w;
  double r;
  double s;
  Color color;
  String text;
  Color textColor;
  IconData? icon;
  String?font;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
          alignment: Alignment.center,
          height: h,
          width: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r),
            color: color,
          ),
          child: text != '' && icon == null
              ? Text(
            text,
            style: TextStyle(
              fontFamily: font,
                fontSize: s,
                fontWeight: FontWeight.bold,
                color: textColor),
          )
              : text == '' && icon != null
              ? Icon(icon)
              : Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 7,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: s,
                    fontWeight: FontWeight.bold,
                    color: textColor,fontFamily: font,),
              ),
            ],
          )),
    );
  }
}
class textbutton extends StatelessWidget {
  textbutton({Key? key ,required this.text,this.color=Colors.black45,this.font='Mulish Medium',required this.onTap}) : super(key: key);
//final onPressed;
  final String text;
  final Function()onTap;
  Color color;
  String?font;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: onTap,
        style:TextButton.styleFrom(
          backgroundColor: Colors.grey[150],

        ),     child: Text(text,
          style:TextStyle(fontSize: 15,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            color: color,
            fontFamily: font,
          ) ,),


      ),);
  }
}

Uint8List convertBase64Image(String base64String){
  Uint8List _bytes=base64.decode(base64String.split(',').last);
  return _bytes;
}
