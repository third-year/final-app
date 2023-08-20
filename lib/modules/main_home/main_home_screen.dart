import 'package:firstflutterproject/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../experts/experts_screen.dart';
import '../profile/profile_screen.dart';
import '../search_experienc/search_experienc_screen.dart';
import '../search_experts/search_experts_screen.dart';
import '../the_expert/the_expert_screen.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  bool isexperiens = true;
  List<bool> isfavorait = [
  false,
  false,
  false,
  false,
  false,
  ];
  List<String> experts = [
    'Medical',
    'vocational',
    'Psychological',
    'family',
    'Business',
  ];
  List<String> photos = [
    'images/935ddd1163798ab63f8defefc6639b0a.jpg',
    'images/1c2cb17bc713c43ab8bd0cb4dd3a1628.jpg',
    'images/dd89d1156bb04755c290969a231c6280.jpg',
    'images/df27bf087a343e5d893c56e9e3767d85.jpg',
    'images/e15903d72cfce084a68ae90ea6c88319.jpg',
  ];

  List<String> expphoto = [
    'images/1aacb718f4086c68ed9c47cd26a2b032.jpg',
    'images/561b38d6ab388a0b7d5103043c229f7d.jpg',
    'images/19a9a4c01147fb635e480849441d7b78.jpg',
    'images/8c034a68eb17102a37f9f6a779ef8619.jpg',
    'images/402cb842f9d6a175e8d907e297a82f8e.jpg',
  ];
  List<String> pexperts = [
    'merna san',
    'jack roben',
    'ahmad nour',
    'jone roel',
    'lina asem',
  ];

  List<int> phone = [
    97350012,
    63592730,
    11794038,
    73397522,
    63984400,
  ];

  List<int> price = [
    97,
    63,
    79,
    70,
    60,
  ];

  List<String> adress = [
    'turkya-istanbul',
    'egypt-qairo',
    'france-paris',
    'syria-damascuse',
    'lebanon-bairut'
  ];

  List<String> dayes = [
    'sunday-monday-tuesday-wednesday',
    'sunday-monday-thersday',
    'monday-tuesday-wednesday-friday',
    'sunday-monday-tuesday-wednesday',
    'monday-tuesday-wednesday-friday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appbarcolor,
          elevation: 5.0,
          titleSpacing: 20.0,
          title: Row(children: [
            Icon(Icons.home),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Home Page',
            )
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  });
                },
                icon: Icon(Icons.perm_identity_sharp))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (isexperiens == false) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchExperiencScreen(),
                          ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'search',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                isexperiens ? buildGridview() : buildGridview2(),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    defualtbutton(
                      text: 'Experience',
                      function: () {
                        setState(() {
                          isexperiens = true;
                        });
                      },
                      background: isexperiens ? firstBackColor : Colors.grey,
                      width: 180.0,
                    ),
                    SizedBox(
                      width: 11.0,
                    ),
                    defualtbutton(
                      text: 'Experts',
                      function: () {
                        setState(() {
                          isexperiens = false;
                        });
                      },
                      background: isexperiens ? Colors.grey : firstBackColor,
                      width: 180.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget buildGridview() => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 300,
        ),
        itemCount: experts.length,
        itemBuilder: (context, index) {
          final item = experts[index];
          final phoitem = photos[index];
          return buildexpert(item, phoitem);
        },
      );
  Widget buildGridview2() => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 300,
        ),
        itemCount: pexperts.length,
        itemBuilder: (context, index) {
          final item = pexperts[index];
          final eitem = experts[index];
          final phonitem = phone[index];
          final addresitem = adress[index];
          final dayesitem = dayes[index];
          final phoexitem = expphoto[index];
          final priceitem = price[index];
          final isfavitem = isfavorait[index];
          return buildpexpert(eitem, item, phonitem, addresitem, dayesitem,
              phoexitem, priceitem,isfavitem);
        },
      );
  Widget buildexpert(String expert, String photo) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpertsScreen(expirenc: expert),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: gredColor,
          ),
          child: GridTile(
            header: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '$expert',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w400,
                  color: firstBackColor,
                ),
              ),
            ),
            child: Center(
              child: Stack(children: [
                Image.asset('$photo'),
              ]),
            ),
            footer: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 5.0, right: 8.0, bottom: 7.0),
              child: Text(
                'prees to see the experts',
                textAlign: TextAlign.center,
                style: TextStyle(color: secondBackColor, fontSize: 15.0),
              ),
            ),
          ),
        ),
      );
  Widget buildpexpert(
          String expert,
          String pexpert,
          int numberitem,
          String addresitem,
          String dayesitem,
          String phoexitem,
          int priceitem,
          bool isfavitem
      ) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TheExpretScreen(
                  expirenc: expert,
                  name: pexpert,
                  number: numberitem,
                  addres: addresitem,
                  dayes: dayesitem,
                  price: priceitem,
                ),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: gredColor,
          ),
          child: GridTile(
              header: Padding(
                padding: const EdgeInsets.all(1.0),
                child:
                Row(
                 children:[
                Text(
                  '$pexpert',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w400),
                ),
                IconButton(onPressed:(){
                             setState(() {
                               isfavitem = !isfavitem;
                             });
                     } ,
                         icon: Icon(Icons.favorite),
                     color: isfavitem?Colors.red:Colors.grey,
                     ),

                ]
                )
              ),
              child: Center(
                child: Stack(
                  children: [
                    Image.asset('$phoexitem'),
                  ],
                ),
              ),
              footer: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$expert  expert',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w400),
                        ),
                        Text('prees to reserve',
                            style: TextStyle(
                                color: secondBackColor, fontSize: 15.0))
                      ]))),
        ),
      );
}
