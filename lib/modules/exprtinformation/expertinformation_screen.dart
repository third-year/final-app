import 'dart:io';

import 'package:firstflutterproject/modules/avilabeldayes/avilabel_dayes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../shared/components/components.dart';
import '../login/login_screen.dart';

class ExpertInformationScreen extends StatefulWidget{
  @override
  State<ExpertInformationScreen> createState() => _ExpertInformationScreenState();
}

class _ExpertInformationScreenState extends State<ExpertInformationScreen> {
  // File? image;
  // Future pickimage () async{
  //   try{
  //     final image=await ImagePicker().pickImage(source:ImageSource.gallery)
  //     if(Image==null)return;
  //     final imageTemp=File(image.path);
  //     final imagePerm=await saveImagePrem(image.path);
  //     setState(() {
  //       this.image=imageTemp;
  //     });
  //   }onPlatform catch
  // }

  var phonecontroller=TextEditingController();
  var addresscontroller=TextEditingController();
  var experitycontroller=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool is1slected=false;

  bool is2slected=false;

  bool is3slected=false;

  bool is4slected=false;

  bool is5slected=false;
  bool issunday=false;

  bool ismonday=false;

  bool istusday=false;

  bool isthersday=false;

  bool isfrayday=false;
  bool iswednsday=false;
  bool issutrday=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:
         Center(
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
             Padding(
                 padding: const EdgeInsets.all(15.0),
                 child:
               Form(
                key:formKey ,
                child: Column(
                  children: [
                    SizedBox(height: 200.0,),
                    Text('you have to enter some information : ',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text('your photo :',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                          ),),
                       SizedBox(width: 25,),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text('what is your experety ?',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                    ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              is2slected=false;
                              is1slected=true;
                              is3slected=false;
                              is4slected=false;
                              is5slected=false;
                            });
                          },
                          child: AnimatedContainer(duration: Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                              color: is1slected? firstBackColor :Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                              border:Border.all(
                                color:Colors.black,
                                width: 1.5,
                              ),

                            ),
                            width: 25.0,
                            height: 25.0,
                            child: is1slected?  Icon(
                              Icons.check,
                              color:Colors.grey,
                              size: 25.0,
                            ):null,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text('Medical',
                        style: TextStyle(
                          fontSize:20 ,
                        ),
                        ),
                        SizedBox(width: 130.0),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              is2slected=true;
                            is1slected=false;
                            is3slected=false;
                            is4slected=false;
                            is5slected=false;
                            });
                          },
                          child: AnimatedContainer(duration: Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                              color: is2slected? firstBackColor :Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                              border:Border.all(
                                color:Colors.black,
                                width: 1.5,
                              ),

                            ),
                            width: 25.0,
                            height: 25.0,
                            child: is2slected?  Icon(
                              Icons.check,
                              color:Colors.grey,
                              size: 25.0,
                            ):null,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text('vocational',
                          style: TextStyle(
                            fontSize:20 ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              is3slected=true;
                              is2slected=false;
                              is1slected=false;
                              is4slected=false;
                              is5slected=false;
                            });
                          },
                          child: AnimatedContainer(duration: Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                              color: is3slected? firstBackColor :Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                              border:Border.all(
                                color:Colors.black,
                                width: 1.5,
                              ),

                            ),
                            width: 25.0,
                            height: 25.0,
                            child: is3slected?  Icon(
                              Icons.check,
                              color:Colors.grey,
                              size: 25.0,
                            ):null,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text('Psychological',
                          style: TextStyle(
                            fontSize:20 ,
                          ),
                        ),
                        SizedBox(width: 78.0),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              is2slected=false;
                              is1slected=false;
                              is4slected=true;
                              is5slected=false;
                              is3slected=false;
                            });
                          },
                          child: AnimatedContainer(duration: Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                              color: is4slected? firstBackColor :Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                              border:Border.all(
                                color:Colors.black,
                                width: 1.5,
                              ),

                            ),
                            width: 25.0,
                            height: 25.0,
                            child: is4slected?  Icon(
                              Icons.check,
                              color:Colors.grey,
                              size: 25.0,
                            ):null,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text('family',
                          style: TextStyle(
                            fontSize:20 ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 23.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children :[
                    GestureDetector(
                      onTap: (){
                        setState((){
                          is2slected=false;
                          is1slected=false;
                          is4slected=false;
                          is5slected=true;
                          is3slected=false;
                        });
                      },
                      child: AnimatedContainer(duration: Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                          color: is5slected? firstBackColor :Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                          border:Border.all(
                            color:Colors.black,
                            width: 1.5,
                          ),

                        ),
                        width: 25.0,
                        height: 25.0,
                        child: is5slected?  Icon(
                          Icons.check,
                          color:Colors.grey,
                          size: 25.0,
                        ):null,
                      ),
                    ),
                        SizedBox(width: 15,),
                        Text('Business',
                            style: TextStyle(
                              fontSize:20 ,)
                        ),
                      ]
                    ),
                    SizedBox(height: 30.0,),

                    defaultFormField(
                      controller:experitycontroller,
                      type: TextInputType.text,
                      prefix:Icons.paste ,

                      label: 'enter your experity',
                      validate: (value){

                        if(value!.isEmpty)
                        {
                          return 'experity must not be empty';
                        }
                        return null;

                      },

                    ),
                    SizedBox(height: 40.0,),
                    defualtbutton(text: 'next',
    width: 250,
    radius: 10.0,
                       function:() {
                         if (formKey.currentState!.validate()) {
                           print(phonecontroller.text);
                           print(addresscontroller.text);
                           print(experitycontroller.text);
                           Navigator.push(context,
                               MaterialPageRoute(
                                 builder: (context) => AvilabeldayesScreen(),
                               ));
                         }
                       }
                    ),
                    SizedBox(height: 20.0,),
                    Image.asset('images/1decff56163ef120145e110681e15b18.jpg'),
                  ],
                ),
              ),
             )
         ]
        )
          ),
        )

    );

  }
}