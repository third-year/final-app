import 'package:flutter/material.dart';
class Text1 extends StatelessWidget {
   Text1({Key? key,required this.text,this.fontWeight=FontWeight.bold,this.color=Colors.black87,this.size=20}) : super(key: key);
    final String text;
    double?size;
    FontWeight?fontWeight;
    Color?color;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color
    ),);
  }
}
