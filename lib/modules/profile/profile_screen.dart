import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../revers/revers_screen.dart';

class ProfileScreen extends StatefulWidget {
  // late final String name;
  //
  // late final String username;
  //
  // ProfileScreen({
  //   required this.name,
  //   required this.username,
  // }
  //     );

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
    appBar:AppBar(
      backgroundColor: appbarcolor,
    ),
          body:
      Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 30.0,
                  fontWeight: FontWeight.w400,
              color: firstBackColor
              ),
            ),
            Text(
              'Alma Ray',
              style: TextStyle(fontSize: 27.0,
                  fontWeight: FontWeight.w400,
              ),
            ),
          ]),
          SizedBox(
            height: 30.0,
          ),
          Row(children: [
          Text(
          'UserName:',
          style: TextStyle(fontSize: 30.0,
          fontWeight: FontWeight.w400,
          color: firstBackColor
          ),
          ),
          Text(
            ' Alm-Ray35',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w400),
          ),]),
          SizedBox(
            height: 30.0,
          ),
    Row(children: [
    Text(
    'Wallet:',
    style: TextStyle(fontSize: 30.0,
    fontWeight: FontWeight.w400,
    color: firstBackColor
    ),
    ),
          Text(
            '500\$',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w400),
          ),
   ] ),

          SizedBox(
            height: 30.0,
          ),
          defualtbutton(text:'reservation', function: (){
            setState(() {
    Navigator.push(
    context,
     MaterialPageRoute(
    builder: (context) => ReversScreen(
    name: '',
    address: '',
    day:'',
    hour: '',
    resrve: false,
    ),
    ));
    });
          })
        ],
      ),
    )
      );
  }
}
