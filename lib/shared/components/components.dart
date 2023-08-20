

// ignore_for_file: sort_child_properties_last

import 'package:firstflutterproject/constant.dart';
import 'package:flutter/material.dart';

Widget defualtbutton({
  double width=double.infinity,
   Color background=firstBackColor,
  bool isUpperCase =true,
  required String text,
  required void Function() function ,
  double radius=0.0,
})  => Container (
  width: width,
  child: MaterialButton(
    onPressed:function,
    child: Text(
        isUpperCase? text.toUpperCase() :text,
      style: TextStyle(
        color:Colors.white,
      ),

    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
        radius,
    ),
    color: background,
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChang,
  bool ispassword=false,
 required String? Function(String?)? validate ,
   String? label,
   IconData? prefix,
  IconData? suffix ,
  void Function()? suffixpressed,

}
)=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: ispassword,
  onFieldSubmitted:onSubmit ,
  onChanged:onChang,
  validator:validate,
  decoration: InputDecoration(
    labelText:label,
    labelStyle:TextStyle(color: strongColor,
    ),
    fillColor: appbarcolor,
    prefixIcon: Icon(
        prefix,
    color: iconcolor,
    ) ,
    suffixIcon:suffix !=null ? IconButton(
      onPressed: suffixpressed,
      icon: Icon(suffix,
        color: iconcolor,
      ),
    ) :null ,
    border: OutlineInputBorder(),
  ),
);
class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;


  WaveClipper({this.waveDeep = 100,this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25 , sh -waveDeep2*2);
    final Offset destinationPoint1 = Offset(sw * .5  , sh - waveDeep- waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75 , sh  - waveDeep*2 );
    final Offset destinationPoint2 = Offset(sw  , sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height-waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, destinationPoint1.dx, destinationPoint1.dy
      )
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy ,destinationPoint2.dx, destinationPoint2.dy
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}