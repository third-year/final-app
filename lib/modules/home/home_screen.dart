import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/modules/profile/profile_screen.dart';
import 'package:firstflutterproject/modules/revers/revers_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_home/main_home_screen.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {



  int currentIndex=1;
  List<String>titels=[
    'Home Page',
  ];
  List<Widget>screens=[
    MainHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white,
      appBar: AppBar(
        backgroundColor: appbarcolor,
        elevation: 5.0,
        titleSpacing: 20.0,
        title:
        Row(
          children: [
         Icon(Icons.home),
        SizedBox(width: 10.0,),
        Text(
          titels[currentIndex],
        )
          ]
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  ProfileScreen())
              );
            });
          }, icon:Icon( Icons.perm_identity_sharp))
        ],
        ),

      body:
      screens[currentIndex],
      // bottomNavigationBar: BottomNavigationBar (
      //   elevation: 5.0,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: appbarcolor,
      //   currentIndex: currentIndex,
      //   onTap: (index){
      //     setState(() {
      //       currentIndex=index;
      //     });
      //   },
      //   items: [
      //
      //     BottomNavigationBarItem(
      //         icon:Icon(Icons.home,
      //           color: iconcolor,
      //         ),
      //     label: 'home'
      //     ),
      //   ],
      // ),
    );
  }
}