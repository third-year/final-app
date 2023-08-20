import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../exprtinformation/expertinformation_screen.dart';
import '../login/login_screen.dart';
class SignupScreen extends StatefulWidget{
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {
  var nameController=TextEditingController();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var confirmpasswordController=TextEditingController();

  var chekboxcontroller=TextEditingController();

  var phoneController=TextEditingController();

  var usernameController=TextEditingController();

  var countryController=TextEditingController();

  var cityController=TextEditingController();

  var formKey=GlobalKey<FormState>();



  bool isPassword = true;
  bool isPassword2 = true;
  bool isuser=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
        child: SingleChildScrollView(
          child:
        Stack(
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

        Padding(
        padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200.0,
                  ),
                  Text('Signup',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    color: firstBackColor,
                  ),
                  ),
                  SizedBox(
                    height: 15.0,),
                  Text('pleas enter your information :',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: firstBackColor,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  defaultFormField(controller: nameController,
                      type: TextInputType.text,
                      validate: (value){

                          if(value!.isEmpty)
                          {
                            return 'you have to enter your name';
                          }
                          return null;

                      },
                      label: 'name',
                      prefix: Icons.abc_rounded),
                  SizedBox(height: 15.0,),
                  defaultFormField(controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value){

                        if(value!.isEmpty)
                        {
                          return 'email must not be empty';
                        }
                        return null;

                      },
                      label: 'email address',
                      prefix: Icons.email_sharp),
                  SizedBox(height: 15.0,),
                  defaultFormField(controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value){

                        if(value!.isEmpty)
                        {
                          return 'password is too short';
                        }
                        return null;
                      },
                      label: 'password',
                      prefix: Icons.lock,
                      suffix:isPassword?Icons.visibility:Icons.visibility_off,
                      ispassword:isPassword,
                      suffixpressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        }
                        );
                      }
                  ),
                  SizedBox(height: 15.0,),
                      defaultFormField(controller: confirmpasswordController,
                          type: TextInputType.visiblePassword,
                          validate: (value){

                            if(value!=passwordController.text)
                            {
                              return 'your password is wrong';
                            }
                            return null;
                          },
                          onSubmit: (value){

                            if(formKey.currentState!.validate())
                            {
                              print(passwordController.text);
                            }
                            return null;
                          },
                          label: 'confirm your password',
                          prefix: Icons.sync_lock_outlined,
                          suffix:isPassword2?Icons.visibility:Icons.visibility_off,
                          ispassword:isPassword2,
                           suffixpressed: () {
                             setState(() {
                               isPassword2 = !isPassword2;
                             }
                             );
                           }
                               ),
                  SizedBox(height: 15.0,),
                  defaultFormField(controller: usernameController,
                      type: TextInputType.text,
                      validate: (value){

                        if(value!.isEmpty)
                        {
                          return 'username must not be empty';
                        }
                        return null;
                      },
                      label: 'user name',
                      prefix: Icons.drive_file_rename_outline_outlined,
                  ),
                  SizedBox(height: 15.0,),
                  defaultFormField(controller: countryController,
                    type: TextInputType.text,
                    validate: (value){

                      if(value!.isEmpty)
                      {
                        return 'country must not be empty';
                      }
                      return null;
                    },
                    label: 'country',
                    prefix: Icons.location_city_outlined,
                  ),
                  SizedBox(height: 15.0,),
                  defaultFormField(controller: cityController,
                    type: TextInputType.text,
                    validate: (value){

                      if(value!.isEmpty)
                      {
                        return 'city must not be empty';
                      }
                      return null;
                    },
                    label: 'city',
                    prefix: Icons.location_on_sharp,
                  ),
                  SizedBox(height: 15.0,),
                  defaultFormField(controller: phoneController,
                    type: TextInputType.phone,
                    validate: (value){

                      if(value!.isEmpty)
                      {
                        return 'you have to enter your phone number';
                      }
                      return null;
                    },
                    label: 'phone number',
                    prefix: Icons.phone_android,
                  ),
                  SizedBox(height: 15.0,),
                      Text('who are you ?'),
                    SizedBox(height: 15.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  GestureDetector(
                    onTap: (){
                      setState((){
                        isuser=true;
                      });
                    },
                    child: AnimatedContainer(duration: Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      decoration: BoxDecoration(
                        color: isuser? firstBackColor :Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),

                      ),
                      width: 25.0,
                      height: 25.0,
                      child: isuser?  Icon(
                        Icons.check,
                        color:Colors.grey,
                        size: 25.0,
                      ):null,
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Text('user'),
                  SizedBox(width: 60.0,),
                    GestureDetector(
                      onTap: (){
                        setState((){
                        isuser=false;
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => ExpertInformationScreen(),
                            ));
                        }

                        );
                      },
                      child: AnimatedContainer(duration: Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                          color: !isuser? firstBackColor :Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                          border:Border.all(
                            color:Colors.black,
                            width: 1.5,
                          ),

                        ),
                        width: 25.0,
                        height: 25.0,
                        child: !isuser?  Icon(
                          Icons.check,
                          color:Colors.grey,
                          size: 25.0,
                        ):null,
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Text('Expert'),
                  ]),
                  SizedBox(height: 40.0,),
                  defualtbutton(text: 'signup',
                      function:() {
                        if (formKey.currentState!.validate()) {
                          print(nameController.text);
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => ScreenLogin(),
                              ));
                        }

                      } ),
              ]
              ),
            ),
          ),
        ]
        ),
      ),
    ),
    );
  }
}