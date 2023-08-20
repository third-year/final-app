import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search,size: 35.0,
         color: strongColor,
    ),
    ],
    title: Text('Setting'.toUpperCase(),
    style: TextStyle(fontSize: 30.0,
    color: secondBackColor,
    fontWeight: FontWeight.w500)
    ),
    elevation: 0.0,
    ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
           Row(
                children: [
                  // Container(
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.rectangle,
                  //       color: Colors.grey,
                  //       borderRadius: BorderRadius.circular(5)
                  //     ),
                  //     child:
                      Text(EconoCubite.get(context).isDark?'Light Mode':'Dark Mode',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w400),),
                  SizedBox(width: 10.0,),
                  CircleAvatar(
                    backgroundColor: EconoCubite.get(context).isDark?Colors.yellowAccent:Colors.indigo,
                    child: IconButton(onPressed: (){
                      EconoCubite.get(context).changAppMode();
                    },
                        icon:Icon(EconoCubite.get(context).isDark? Icons.light_mode:Icons.dark_mode ),),
                  ),
                ],
              //),
        ),
]    )
      ),
    );
  }

}