import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/constant.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/helper/screenSizehelper.dart';
import 'package:yallawin/helper/sharedPreHelper.dart';
import 'package:yallawin/helper/timeHelper.dart';
import 'package:yallawin/helper/timeZoneApi.dart';
import 'package:yallawin/reUsableCom.dart';

class MainScreen extends StatefulWidget {
  static final String id = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int hour = 0, min = 0, sec = 0;
  late Timer _timer;
  int _start = 10;
  bool loading = true;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            int x = _start;
            hour = (x / 3600).floor();
            x = x % 3600;
            min = (x / 60).floor();
            x = x % 60;
            sec = x;
          });
        }
      },
    );
  }

  Future<void> getDataFromSharedPre() async {
    context.read<ProviderHelper>().setPreTime(MyTime(
        await SharedPre.getYear(),
        await SharedPre.getMonth(),
        await SharedPre.getDay(),
        await SharedPre.getHour(),
        await SharedPre.getMin(),
        await SharedPre.getSec()));
  }

  @override
  void initState() {
    super.initState();
    getDataFromSharedPre().then((val) {
      getTime().then((value) {
        setState(() {
          _start =
              MyTime.comperTime(context.read<ProviderHelper>().preTime, value);
          print(context.read<ProviderHelper>().preTime.hour);
          _start = _start < 0 ? 0 : _start;
          startTimer();
          loading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingContainer(
            loadingScreenContant: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Loading ...',
                  style: TextStyle(color: secondColor),
                ),
                CircularProgressIndicator(
                  color: secondColor,
                ),
              ],
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ProviderHelper>().convertToDarkMode();
                  },
                  icon: Icon(
                    Icons.wb_sunny,
                    color: context.watch<ProviderHelper>().firstColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            drawer: MainDrawar(),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage(
                            context.watch<ProviderHelper>().firstImage),
                        width: getDeviceType()
                            ? 4 * MediaQuery.of(context).size.width / 5
                            : MediaQuery.of(context).size.width,
                      ),
                      Text('Click on any phoenix and get 1 point'),
                      Text(
                        'you can click every 4 hours',
                        style: TextStyle(color: thirdColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClickablePhoenix(),
                            ClickablePhoenix(),
                            ClickablePhoenix(),
                            ClickablePhoenix(),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      MyButton(
                        buttonText: 'Get 10 point',
                        buttonColor: _start == 0
                            ? context.watch<ProviderHelper>().firstColor
                            : context
                                .watch<ProviderHelper>()
                                .firstColor
                                .withOpacity(0.4),
                        buttonFunction:
                            _start == 0 ? getPointButtonFunction() : () {},
                        textColor: context.watch<ProviderHelper>().secondColor,
                        minwidth: 1,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('You can get 10 point after')),
                      Text(timeFormer())
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage(thirdImage),
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Footer()
                    ],
                  )
                ],
              ),
            ),
          );
  }

  String timeFormer() {
    String x = hour > 9 ? hour.toString() : '0' + hour.toString();
    x += ':';
    x += min > 9 ? min.toString() : '0' + min.toString();
    x += ':';
    x += sec > 9 ? sec.toString() : '0' + sec.toString();
    return x;
  }

  getPointButtonFunction() {
    getTime().then((value) async {
      context.read<ProviderHelper>().setPreTime(value);
      setState(() {
        _start =
            MyTime.comperTime(context.read<ProviderHelper>().preTime, value);
        _start = _start < 0 ? 0 : _start;

        startTimer();
      });
      await SharedPre.setYear(context.read<ProviderHelper>().preTime.year);
      await SharedPre.setMonth(context.read<ProviderHelper>().preTime.month);
      await SharedPre.setDay(context.read<ProviderHelper>().preTime.day);
      await SharedPre.setHour(context.read<ProviderHelper>().preTime.hour);
      await SharedPre.setMin(context.read<ProviderHelper>().preTime.min);
      await SharedPre.setSec(context.read<ProviderHelper>().preTime.sec);
      setState(() {
        loading = false;
      });
    });
  }
}

class LoadingContainer extends StatelessWidget {
  final Widget loadingScreenContant;

  const LoadingContainer({required this.loadingScreenContant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: firstColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: MediaQuery.of(context).size.height / 5,
          width: 2 * MediaQuery.of(context).size.width / 3,
          child: loadingScreenContant,
        ),
      ),
    );
  }
}

class ClickablePhoenix extends StatefulWidget {
  @override
  _ClickablePhoenixState createState() => _ClickablePhoenixState();
}

class _ClickablePhoenixState extends State<ClickablePhoenix> {
  String imageSrc = thirdImage;
  bool test = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: test == true
          ? () {
              setState(() {
                imageSrc = context.read<ProviderHelper>().firstImage;
                test = false;
              });
            }
          : null,
      child: Image(
        image: AssetImage(imageSrc),
        width: MediaQuery.of(context).size.width / 5,
      ),
    );
  }
}
