import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Text1.dart';
import '../../../constant.dart';
import '../add_product/cubit_product.dart';
import '../add_product/state_product.dart';

class chargr_wallet extends StatelessWidget {

  var charge=TextEditingController();
  var formkay =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>product_cubit(),
        child: BlocConsumer<product_cubit,state_product> (
        listener:(context,state){},
    builder: (context,state) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {},
            icon: Icon(Icons.account_balance_wallet_rounded, size: 35.0,),
            color: strongColor,
          ),
        ],
        title: Text('charge wallet'.toUpperCase(),
            style: TextStyle(fontSize: 30.0,
                color: secondBackColor,
                fontWeight: FontWeight.w500)
        ),
        elevation: 0.0,
      ),
      body: Container(

        decoration: BoxDecoration(
          color:  Colors.grey[150],

        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key:formkay ,

            child: Column(

              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('amount',style: Theme.of(context).textTheme.headline6),
                ),
                SizedBox(height: 10,),
                DefaultTextaField(
                  hint: '',
                  color: Colors.white,
                  r: 0,
                  type:TextInputType.number,
                  controller: charge, validate1: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter ';
                  }
                  return null;
                },),
                SizedBox(height: 10,),
                Center(
          child: DefaultButton(text: 'Save',
          color: Color(0xFF439A97), s: 20,r: 30,w: 180,
          onTap: () {
          if (formkay.currentState!.validate()) {
            product_cubit.product(context).ChargeWallet(
                charger: int.parse(charge.text),
              context: context
            );
          }},
          ),
          )
              ],

            ),
          ),
        ),
      ),
    ) ;
  }
    ));
}
}
