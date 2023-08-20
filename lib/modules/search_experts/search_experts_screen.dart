import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget{
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstBackColor,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color: Colors.grey[400]
          ),
          child: defaultFormField(controller: searchController
              , type: TextInputType.text,
              validate:(value){
            if(value!.isEmpty){
              return 'search must not be empty';
            }
            else{
              return null;
            }
              } ,
          label: 'enter expert name to search',
            prefix: Icons.search,

          ),
        ),
      ),

    );
  }

}