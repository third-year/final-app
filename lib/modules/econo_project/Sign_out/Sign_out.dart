import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

import '../sign1.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Logout'.toUpperCase(),
              style: TextStyle(
                  fontSize: 30.0,
                  color: secondBackColor,
                  fontWeight: FontWeight.w500)),
          actions: [
            Icon(
              Icons.logout,
              color: secondBackColor,
              size: 40.0,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'click here to logout',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Center(
                            child: DefaultButton(
                                onTap: () {
                                  CacheHelper.removeData(
                                    key: 'token',
                                  ).then((value) {
                                    if (value) {
                                      print(CacheHelper.gettoken(key: 'token'));
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => sign1()),
                                          (route) => false);
                                    }
                                  });
                                },
                                text: 'logout'.toUpperCase(),
                                s: 20.0,
                                color: strongColor,
                                w: 250.0),
                          ),
                        ])))));
  }
}
