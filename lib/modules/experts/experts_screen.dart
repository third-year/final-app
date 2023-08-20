
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../the_expert/the_expert_screen.dart';

class ExpertsScreen extends StatefulWidget {
  late final String expirenc;

  ExpertsScreen({
    required this.expirenc,
  }
      );

  @override
  State<ExpertsScreen> createState() => _ExpertsScreenState();
}

class _ExpertsScreenState extends State<ExpertsScreen> {
  List<String>experts=[
    'Medical',
    'vocational',
    'Psychological',
    'family',
    'Business',
  ];

  List <String>pexperts=[
    'jack roben',
    'lisa jan',
    'michel rayen',
    'liam amier',
  ];


  List <int>phone=[
    97350012,
    63592730,
    11794038,
    73397522,
  ];

  List <int>price=[
    90,
    60,
    74,
    52,
  ];

  List <String>adress=[
    'turkya-istanbul',
    'egypt-qairo',
    'france-paris',
    'syria-damascuse',
  ];

  List <String>dayes=[
    'sunday-monday-tuesday-wednesday',
    'sunday-monday-thersday',
    'monday-tuesday-wednesday-friday',
    'sunday-monday-tuesday-wednesday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            buildGridview2(),
          ],
        ),
      ),
    );
  }

  Widget buildGridview2() => GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      mainAxisExtent: 250,
    ),
    itemCount: pexperts.length,
    itemBuilder: (context, index) {
      final item = pexperts[index];
      final numberitem = phone[index];
      final addresitem = adress[index];
      final dayesitem = dayes[index];
      final priceitem=price[index];
      return buildpexpert(widget.expirenc,item,numberitem,addresitem,dayesitem,priceitem);
    },
  );

  Widget buildpexpert(String expertitem,String pexpert,int numberitem,String addresitem,String dayesitem,int priceitem ) => GestureDetector(
    onTap: (){

      Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => TheExpretScreen(
          expirenc: expertitem,
          name: pexpert,
          number: numberitem,
          addres: addresitem,
          dayes: dayesitem,
            price:priceitem,
          ),
      ));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color:firstBackColor,
      ),
      child:GridTile(
        header: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('$pexpert',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23.0,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
        child: Center(
            child: Text('$expertitem')),
        footer: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('prees to revers',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}