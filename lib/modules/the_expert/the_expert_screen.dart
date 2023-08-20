import 'package:firstflutterproject/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../revers/revers_screen.dart';

class TheExpretScreen extends StatefulWidget {
  late final String name;

  late final int number;

  late final String addres;

  late final String dayes;

  late final String expirenc;

  late final int price;

  TheExpretScreen({
    required this.name,
    required this.number,
    required this.addres,
    required this.dayes,
    required this.expirenc,
    required this.price
  });

  @override
  State<TheExpretScreen> createState() => _TheExpretScreenState();
}

class _TheExpretScreenState extends State<TheExpretScreen> {
  bool resrve = false;

  bool issunday = true;

  bool ismonday = false;

  bool istusday = false;

  bool isthersday = false;

  bool isfrayday = false;

  bool iswednsday = false;

  bool issutrday = false;

  List<int> hours = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
  ];

  List<int> leftHours = [
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    24,
  ];
  String slected = '0';
  String day = 'sunday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:${widget.name}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Phone:${widget.number}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Address:${widget.addres}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Dayes:${widget.dayes}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Price:${widget.price}\$',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: defualtbutton(
                      text: 'reserve',
                      function: () {
                        setState(() {
                          resrve = true;
                        });
                      },
                      width: 300.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Text(
                          'choose a day',
                          style: TextStyle(fontSize: 20.0),
                        )
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  issunday = !issunday;
                                  issutrday = false;
                                  ismonday = false;
                                  istusday = false;
                                  isthersday = false;
                                  isfrayday = false;
                                  iswednsday = false;
                                  day = 'sunday';
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                decoration: BoxDecoration(
                                  color:
                                      issunday ? firstBackColor : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                width: 25.0,
                                height: 25.0,
                                child: issunday
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.grey,
                                        size: 25.0,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('Sunday',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ismonday = !ismonday;
                                  issunday = false;
                                  issutrday = false;
                                  istusday = false;
                                  isthersday = false;
                                  isfrayday = false;
                                  iswednsday = false;
                                  day = 'monday';
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                decoration: BoxDecoration(
                                  color:
                                      ismonday ? firstBackColor : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                width: 25.0,
                                height: 25.0,
                                child: ismonday
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.grey,
                                        size: 25.0,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('Monday',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                istusday = !istusday;
                                issunday = false;
                                issutrday = false;
                                ismonday = false;
                                isthersday = false;
                                isfrayday = false;
                                iswednsday = false;
                                day = 'tuesday';
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                color: istusday ? firstBackColor : Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              width: 25.0,
                              height: 25.0,
                              child: istusday
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.grey,
                                      size: 25.0,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Tuesday',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          SizedBox(
                            width: 20.0,
                          ),
                        ])
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                iswednsday = !iswednsday;
                                issunday = false;
                                issutrday = false;
                                ismonday = false;
                                istusday = false;
                                isthersday = false;
                                isfrayday = false;
                                day = 'wednesday';
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                color:
                                    iswednsday ? firstBackColor : Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              width: 25.0,
                              height: 25.0,
                              child: iswednsday
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.grey,
                                      size: 25.0,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text('Wednesday',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          SizedBox(
                            width: 11.0,
                          ),
                        ])
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isthersday = !isthersday;
                                  issunday = false;
                                  issutrday = false;
                                  ismonday = false;
                                  istusday = false;
                                  isfrayday = false;
                                  iswednsday = false;
                                  day = 'thursday';
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                decoration: BoxDecoration(
                                  color:
                                      isthersday ? firstBackColor : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                width: 25.0,
                                height: 25.0,
                                child: isthersday
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.grey,
                                        size: 25.0,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Thursday',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isfrayday = !isfrayday;
                                  issunday = false;
                                  issutrday = false;
                                  ismonday = false;
                                  istusday = false;
                                  isthersday = false;
                                  iswednsday = false;
                                  day = 'friday';
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                decoration: BoxDecoration(
                                  color:
                                      isfrayday ? firstBackColor : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                width: 25.0,
                                height: 25.0,
                                child: isfrayday
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.grey,
                                        size: 25.0,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text('Friday',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            SizedBox(
                              width: 25.0,
                            )
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 30.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  issutrday = !issutrday;
                                  issunday = false;
                                  ismonday = false;
                                  istusday = false;
                                  isthersday = false;
                                  isfrayday = false;
                                  iswednsday = false;
                                  day = 'saturday';
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                decoration: BoxDecoration(
                                  color:
                                      issutrday ? firstBackColor : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                width: 25.0,
                                height: 25.0,
                                child: issutrday
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.grey,
                                        size: 25.0,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'saturday',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 39.0,
                            ),
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 20.0,
                  ),
                  resrve
                      ? Text(
                          'choose an houre',
                          style: TextStyle(fontSize: 20.0),
                        )
                      : Text(''),
                  SizedBox(
                    height: 20.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '1';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '2';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '2',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '3';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '3',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '4';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '4',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '5';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '5',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '6';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '6',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '7';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '7',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '8';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '8',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '9';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '9',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '10';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '10',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '11';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '11',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '12';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '12',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 20.0,
                  ),
                  resrve
                      ? Row(children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '13';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '13',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '14';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '14',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '15';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '15',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '16';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '16',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '17';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '17',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '18';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '18',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '19';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '19',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  slected = '20';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  '20',
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )),
                          SizedBox(
                            width: 10.0,
                          )
                        ])
                      : Text(''),
                  SizedBox(
                    height: 20.0,
                  ),
                  resrve
                      ? Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '21';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '21',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '22';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '22',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '23';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '23',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slected = '24';
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    '24',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                )),
                          ],
                        )
                      : Text(''),
                  SizedBox(
                    height: 20.0,
                  ),
                  resrve
                      ? Row(children: [
                          Text(
                            'confirm for this hour?',
                            style: TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.w400,
                                color: iconcolor),
                          ),
                          Text(
                            ' $slected',
                            style: TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.w400,
                                color: endtimecolor),
                          )
                        ])
                      : Text(''),
                  SizedBox(
                    height: 10.0,
                  ),
                  resrve
                      ? Center(
                          child: defualtbutton(
                              text: 'confirm',
                              function: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReversScreen(
                                          name: widget.name,
                                          address: widget.addres,
                                          day: day,
                                          hour: slected,
                                          resrve: resrve,
                                        ),
                                      ));
                                });
                              },
                              width: 250))
                      : Text('')
                ],
              )),
        ),
      ),
    );
  }
}
