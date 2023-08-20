import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:flutter/material.dart';
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: EconoCubite.get(context).isDark?Colors.black45:Colors.white,
      child: Stack(
          children:[
            Container(
              decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.fill , image: AssetImage('images/logo.jpg'))),
              width: double.infinity,
              height: 300,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white10,
                  radius: 60,
                ),
              ),
            ),
          ]
      ),
    );
  }
}