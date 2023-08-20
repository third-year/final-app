import 'package:flutter/material.dart';

import '../../../constant.dart';

class AboutApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {},
              icon: Icon(Icons.laptop_chromebook_outlined, size: 35.0,),
              color: strongColor,
            ),
          ],
          title: Text('About app'.toUpperCase(),
              style: TextStyle(fontSize: 30.0,
                  color: secondBackColor,
                  fontWeight: FontWeight.w500)
          ),
          elevation: 0.0,
        ),
        body: Column(children: [],)
    );
  }
}