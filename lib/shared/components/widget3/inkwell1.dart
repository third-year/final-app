import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
        required this.onTap,
        this.h = 60,
        this.w = 120,
        this.r = 20,
        this.s = 15,
        this.color = Colors.indigo,
        this.text = '',
        this.textColor = Colors.white,
        this.icon,
      this.coloricon=Colors.black87,
      this.sizeIcon=20
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
  Color coloricon;
  IconData? icon;
  double ?sizeIcon;
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
                fontSize: s,
                fontWeight: FontWeight.bold,
                color: textColor),
          )
              : text == '' && icon != null
              ? Icon(icon,)
              : Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
            children: [
                Icon(icon,color: coloricon,size: sizeIcon),
                SizedBox(
                  width: 7,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: s,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
            ],
          ),
              )),
    );
  }
}
