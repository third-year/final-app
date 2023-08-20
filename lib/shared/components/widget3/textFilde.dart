import 'package:flutter/material.dart';

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
      this.suffixPressed})
      : super(key: key);
  final String? Function(String?)? validate1;
  final void Function() ?suffixPressed;
  Color? color;
  Color? color1;
  String hint;
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
  }
}
