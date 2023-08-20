import 'package:firstflutterproject/modules/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../shared/components/components.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
            child: SingleChildScrollView(
              child:Stack(
                  children: [
                  ClipPath(
                  clipper: WaveClipper(),
              child: Container(
                padding: const EdgeInsets.only(bottom: 450),
                color: appbarcolor.withOpacity(.8),
                height: 200,
                alignment: Alignment.center,

              ),
            ),
            ClipPath(
              clipper: WaveClipper(waveDeep: 0, waveDeep2: 100 ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 50),
                color: appbarcolor.withOpacity(.3),
                height: 180,
                alignment: Alignment.center,

              ),
            ),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.0),
                    Text('welcome back !',
                    style: TextStyle(fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                      color: firstBackColor
                    ),
                    ),
               Image.asset('images/5c151710f6dee31dcaca479a25b47acf.jpg'),
                SizedBox(height: 20.0,),
                TextButton(onPressed:(){
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context)=> ScreenLogin(),
                      ));
                },
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ))

        ]
      ),
            ]
            ),
            )
          )
    );
  }
}