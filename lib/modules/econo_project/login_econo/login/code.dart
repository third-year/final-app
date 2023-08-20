import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Text1.dart';
import '../../../../constant.dart';

import '../../../../new_things/widget3/toast.dart';
import '../login_cubit/cubit.dart';
import '../login_cubit/states.dart';
import 'newpassword.dart';

class code extends StatelessWidget {
String email ;
  var codecontroller =TextEditingController();
  var formkay =GlobalKey<FormState>();
  code({
    required this.email
  });


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ELoginCubit,ELoginSates> (
        listener:(context,state){
      if(state is CodeSuccessState){
         Navigator.push(context,
           MaterialPageRoute(builder: (context) => newpassword(code1:codecontroller.text)),);
      }  if(state is CodeSuccessState){
        toast(mas: 'entercode', colors: Colors.red);

      }


    },
    builder:(context,state) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image:  AssetImage('assets/images/12.png'),fit: BoxFit.cover)
          ),
          child: ListView(
              children:[ Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkay,
                  child: Column(children: [
                    SizedBox(height: 200,),
                    Text1(text: 'Password reset',font: 'BebasNeue Regular'
                      ,size: 30,
                      color: Colors.yellow,),
                    SizedBox(height: 30,),
                    Text('we sent a code to'+email,
                      style: Theme.of(context).textTheme.displayLarge,),
                    SizedBox(height: 20,),
                    DefaultTextaField(hint: 'Code*'
                      ,icon: Icons.create_sharp,
                      controller:codecontroller,

                      color: Colors.grey[300],
                      color1: Color(0xFF439A97),

                      validate1:   ( value){
                        if(value==null ||value.isEmpty){ return 'please enter the code';}
                        return null;

                      },),
                    SizedBox(height: 30,),
                    ConditionalBuilder(
                      condition: state is! CodeLoadingState,
                      builder:(context)=> DefaultButton(text:'Continue',s: 30,
                        onTap: (){
                        if(formkay.currentState!.validate()) {
                            ELoginCubit.get(context).codepaasswordc(
                              code:codecontroller.text);
                          };},
                        color: Color(0xFF439A97),w: 180,h: 50,),
                    fallback: (context)=>Center(child: CircularProgressIndicator(),),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Didnt recieve the email?',
                       style:Theme.of(context).textTheme.displayMedium
                       ),
                        textbutton(text:'Click to resend',onTap: (){
                          ELoginCubit.get(context).forgetpaasswordc(email:email);

                          },
                                color: Colors.yellow,),

                      ],
                    )
                  ],),
                ),
              ),
              ]),



        ));
    });
    }}
