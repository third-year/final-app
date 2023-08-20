import 'package:flutter/material.dart';

class textbutton extends StatelessWidget {
  textbutton(
      {Key? key,
      required this.text,
      this.color = Colors.black87,
      required this.onTap,
        this.size=15})
      : super(key: key);
  final String text;
  final Function() onTap;
  Color color;
  double size;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[150],
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            color: color),
      ),
    ));
  }
}
