import 'package:flutter/material.dart';

class textbuttonR extends StatelessWidget {
  textbuttonR(
      {Key? key,
        required this.text,
        this.color=Colors.grey ,
        required this.onTap, required this.size,})
      : super(key: key);
  final String text;
  final Function() onTap;
  final double size;
  Color ?color;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[150],
              ),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.w400,

                    color: color),
              ),
            ),
          ],
        ));
  }
}
