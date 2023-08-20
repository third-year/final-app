import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firstflutterproject/layout/home_lyout/home_lyout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../layout/home_lyout/cubite/cubite.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../login_econo/login/signin.dart';
import '../sign1.dart';
import 'on_bording.dart';

class Splash extends StatelessWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Widget widget;
    dynamic onBoarding = CacheHelper.getData(key: 'onboarding');
    token=CacheHelper.gettoken(key: 'token');
    print(token.toString());
    print(onBoarding);

    if(onBoarding != null) {
      if (token != null) {
        EconoCubite.get(context).gethomedata();
        EconoCubite.get(context).getFav();
        widget = HomeLyoutScreen();}
      else widget = sign1();
    }
      else{
        widget=OnBoarding();
    }

    return AnimatedSplashScreen(
      splash:
        Column(
          children: [
            Image.asset('images/logo.png')
          ],
        ),
        centered: true,
        backgroundColor:Colors.white,
         nextScreen:widget ,
           splashIconSize: 415,
      duration: 2500,
     splashTransition: SplashTransition.slideTransition,
      //pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
