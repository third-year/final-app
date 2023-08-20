import 'package:firstflutterproject/modules/econo_project/sign1.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constant.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardControler = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'images/shop.png',
        title: 'Online Shopping',
        body:
            'You can sell and buy goods and products with different varieties and you are in your home'),
    BoardingModel(
        image: 'images/dilivary.png',
        title: 'Fast Delivery',
        body: 'Locate and we will come with your purchases to your place'),
    BoardingModel(
        image: 'images/cash.png',
        title: 'Easy Payment',
        body: 'Feature of electronic payment'),
  ];
  bool isLast = false;

  void submit() {
    // CachHelper.saveData(key: 'onBoarding', value: true).then((value) {
    // if(value==true){
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => sign1()), (route) => true);
    //  }
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: submit,
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: strongColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  //لون السحبة الاخيرة والاولى
                  physics: BouncingScrollPhysics(),
                  controller: boardControler,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boardControler,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: strongColor,
                          dotHeight: 10,
                          expansionFactor: 4,
                          dotWidth: 10,
                          spacing: 5),
                      count: boarding.length),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: strongColor,
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardControler.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
}
