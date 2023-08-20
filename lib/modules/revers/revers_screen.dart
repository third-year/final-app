import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class ReversScreen extends StatelessWidget{
  late final String name;
  late final String address;
  late final String day;
  late final String hour;
  late final bool resrve;

  ReversScreen({
    required this.name,
    required this.address,
    required this.day,
    required this.hour,
    required this.resrve,

  }
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
        Colors.white,
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  resrve?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                    Row(
                    children: [
                      Text('your reserve is in :',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: firstBackColor
                      ),),])
                      ,SizedBox(height: 10.0,),
                      Row(children:[
                        Text('$address',style: TextStyle
                          (
                          color: textform,
                          fontSize: 20.0
                        ),),
                      Text(' in '),
                      Text('$day',style: TextStyle
                        (
                          color:textform,
                          fontSize: 20.0
                      ),),
                      Text( ' at hour '),
                      Text('$hour',style: TextStyle
                        (
                          color: thirdBackColor,
                          fontSize: 20.0
                      ),),
                        ]),
                      SizedBox(height: 10.0,),
                      Row(
                        children:[
                      Text(' with the expert '),
                      Text('$name ',style: TextStyle
                        (
                          color: textform,
                          fontSize: 20.0
                      ),
                      ),])
                    ],


                  ):Center(child: Text('There is no reverses yet',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ))
                ],
              ),

          ],

    ),
      )
    );
  }
}