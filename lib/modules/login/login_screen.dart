import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../shared/components/components.dart';
import '../main_home/main_home_screen.dart';
import '../signin/signup_screen.dart';
import 'login_controller.dart';
import 'login_service.dart';

class ScreenLogin extends StatefulWidget {
  // late final String name;
  //
  // late final String username;
  //
  // ScreenLogin({
  //   required this.name,
  //   required this.username,
  // }
  //     );

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  bool isuser = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
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
          clipper: WaveClipper(waveDeep: 0, waveDeep2: 100),
          child: Container(
            padding: const EdgeInsets.only(bottom: 50),
            color: appbarcolor.withOpacity(.3),
            height: 180,
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Center(child: Image.asset('images/pen-logo.png')),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(children: [
                    Text('Login',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: firstBackColor,
                        )),
                    SizedBox(
                      width: 100.0,
                    ),
                    Image.asset('images/762e0521caf4756caa68dbf7054e4efb.jpg')
                  ]),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    prefix: Icons.email,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    label: 'email address',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password is too short';
                        }
                        return null;
                      },
                      label: 'password',
                      prefix: Icons.lock,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      ispassword: isPassword,
                      suffixpressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  defualtbutton(
                    text: 'login',
                    function: () {
                      if (formKey.currentState!.validate()) {
                        //print(emailController.text);
                        //print(passwordController.text);
                        LoginModel log = LoginModel(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        log.login();
                        // LoginController().login(log);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainHomeScreen(),
                            ));
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have An Account ?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ));
                          },
                          child: Text(
                            'Sign Up Now',
                            style: TextStyle(
                              color: textform,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
        ),
      ]),
    );
  }
}
