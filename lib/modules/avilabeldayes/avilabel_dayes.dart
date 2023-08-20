import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../shared/components/components.dart';
import '../login/login_screen.dart';

class AvilabeldayesScreen extends StatefulWidget {
  @override
  State<AvilabeldayesScreen> createState() => _AvilabeldayesScreenState();
}

class _AvilabeldayesScreenState extends State<AvilabeldayesScreen> {
  DateTime dateTime = DateTime(8, 30);
  // create TimeOfDay variable
  var selectedtime = TimeOfDay.now();
  //show time picker method
  TimeOfDay _timeOfDays = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayse = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDaym = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayme = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayt = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayte = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayw = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDaywe = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayth = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDaythe = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayf = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayfe = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayst = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDayste = TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDays,
    ).then((value) {
      setState(() {
        _timeOfDays = value!;
      });
    });
  }

  void _showTimePicker1() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayse,
    ).then((value1) {
      setState(() {
        _timeOfDayse = value1!;
      });
    });
  }

  void _showTimePickerm() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDaym,
    ).then((value) {
      setState(() {
        _timeOfDaym = value!;
      });
    });
  }

  void _showTimePickerme() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayme,
    ).then((value1) {
      setState(() {
        _timeOfDayme = value1!;
      });
    });
  }

  void _showTimePickert() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayt,
    ).then((value) {
      setState(() {
        _timeOfDayt = value!;
      });
    });
  }

  void _showTimePickerte() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayte,
    ).then((value1) {
      setState(() {
        _timeOfDayte = value1!;
      });
    });
  }

  void _showTimePickerw() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayw,
    ).then((value) {
      setState(() {
        _timeOfDayw = value!;
      });
    });
  }

  void _showTimePickerwe() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDaywe,
    ).then((value1) {
      setState(() {
        _timeOfDaywe = value1!;
      });
    });
  }

  void _showTimePickerth() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayth,
    ).then((value) {
      setState(() {
        _timeOfDayth = value!;
      });
    });
  }

  void _showTimePickerthe() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDaythe,
    ).then((value1) {
      setState(() {
        _timeOfDaythe = value1!;
      });
    });
  }

  void _showTimePickerf() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayf,
    ).then((value) {
      setState(() {
        _timeOfDayf = value!;
      });
    });
  }

  void _showTimePickerfe() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayfe,
    ).then((value1) {
      setState(() {
        _timeOfDayfe = value1!;
      });
    });
  }

  void _showTimePickerst() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayst,
    ).then((value) {
      setState(() {
        _timeOfDayst = value!;
      });
    });
  }

  void _showTimePickerste() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDayste,
    ).then((value1) {
      setState(() {
        _timeOfDayste = value1!;
      });
    });
  }

  bool issunday = false;

  bool ismonday = false;

  bool istusday = false;

  bool isthersday = false;

  bool isfrayday = false;
  bool iswednsday = false;
  bool issutrday = false;
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minuts = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Stack(children: [
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 170.0,
            ),
            Image.asset('images/be50595e4a73161ee35c198023fdbd1d.jpg'),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'what are your permanence days ?',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: firstBackColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    issunday = !issunday;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: issunday ? firstBackColor : Colors.grey,
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
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: issunday
                    ? MaterialButton(
                        onPressed: _showTimePicker,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Start Time',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        color: timecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: issunday
                    ? Text(
                        _timeOfDays.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: issunday
                    ? MaterialButton(
                        onPressed: _showTimePicker1,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: issunday
                    ? Text(
                        _timeOfDayse.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    ismonday = !ismonday;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: ismonday ? firstBackColor : Colors.grey,
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
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: ismonday
                    ? MaterialButton(
                        onPressed: _showTimePickerm,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Start Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: timecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: ismonday
                    ? Text(
                        _timeOfDaym.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: ismonday
                    ? MaterialButton(
                        onPressed: _showTimePickerme,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: ismonday
                    ? Text(
                        _timeOfDayme.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    istusday = !istusday;
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
              Container(
                width: 150.0,
                height: 40.0,
                child: istusday
                    ? MaterialButton(
                        onPressed: _showTimePickert,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Start Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: timecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: istusday
                    ? Text(
                        _timeOfDayt.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: istusday
                    ? MaterialButton(
                        onPressed: _showTimePickerte,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: istusday
                    ? Text(
                        _timeOfDayte.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      iswednsday = !iswednsday;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                      color: iswednsday ? firstBackColor : Colors.grey,
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
                Container(
                  width: 150.0,
                  height: 40.0,
                  child: iswednsday
                      ? MaterialButton(
                          onPressed: _showTimePickerw,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Start Time',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          color: timecolor,
                        )
                      : null,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  child: iswednsday
                      ? Text(
                          _timeOfDayw.format(context).toString(),
                          style: TextStyle(fontSize: 20),
                        )
                      : null,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: iswednsday
                    ? MaterialButton(
                        onPressed: _showTimePickerwe,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: iswednsday
                    ? Text(
                        _timeOfDaywe.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isthersday = !isthersday;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: isthersday ? firstBackColor : Colors.grey,
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
              Text('Thursday',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: isthersday
                    ? MaterialButton(
                        onPressed: _showTimePickerth,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Start Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: timecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: isthersday
                    ? Text(
                        _timeOfDayth.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: isthersday
                    ? MaterialButton(
                        onPressed: _showTimePickerthe,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: isthersday
                    ? Text(
                        _timeOfDaythe.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isfrayday = !isfrayday;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                      color: isfrayday ? firstBackColor : Colors.grey,
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
                ),
                Container(
                  width: 150.0,
                  height: 40.0,
                  child: isfrayday
                      ? MaterialButton(
                          onPressed: _showTimePickerf,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Start Time',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          color: timecolor,
                        )
                      : null,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  child: isfrayday
                      ? Text(
                          _timeOfDayf.format(context).toString(),
                          style: TextStyle(fontSize: 20),
                        )
                      : null,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: isfrayday
                    ? MaterialButton(
                        onPressed: _showTimePickerfe,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: isfrayday
                    ? Text(
                        _timeOfDayfe.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      issutrday = !issutrday;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                      color: issutrday ? firstBackColor : Colors.grey,
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
                Text('saturday',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(
                  width: 39.0,
                ),
                Container(
                  width: 150.0,
                  height: 40.0,
                  child: issutrday
                      ? MaterialButton(
                          onPressed: _showTimePickerst,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Start Time',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          color: timecolor,
                        )
                      : null,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  child: issutrday
                      ? Text(
                          _timeOfDayst.format(context).toString(),
                          style: TextStyle(fontSize: 20),
                        )
                      : null,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 130.0,
              ),
              Container(
                width: 150.0,
                height: 40.0,
                child: issutrday
                    ? MaterialButton(
                        onPressed: _showTimePickerste,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('End Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        color: endtimecolor,
                      )
                    : null,
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: issutrday
                    ? Text(
                        _timeOfDayste.format(context).toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    : null,
              ),
            ]),
            SizedBox(
              height: 5.0,
            ),
            defualtbutton(
                text: 'done',
                width: 250,
                radius: 10.0,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenLogin(),
                      ));
                })
          ]),
        ),
      ]),
    )));
  }
}
