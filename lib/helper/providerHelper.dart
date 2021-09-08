import 'package:flutter/material.dart';
import 'package:yallawin/helper/timeHelper.dart';

class ProviderHelper extends ChangeNotifier {
  String userId = 'SADAGGFDD';
  String fullName = 'Hasan Ahmad';
  String email = 'HasanAhmad@gmail.com';
  String mobile = '09232848988';
  String password = '***********';

  bool darkMode = false;

  bool preData = false;

  MyTime preTime = MyTime(2021, 7, 15, 16, 33, 1);

  Color firstColor = Color(0XFF212121);
  Color secondColor = Color(0XFFe5e5e5);

  String firstImage = 'assets/images/logo1.png';
  String secondImage = 'assets/images/logo2.png';

  void convertToDarkMode() {
    if (darkMode) {
      darkMode = false;
      firstColor = Color(0XFF212121);
      secondColor = Color(0XFFe5e5e5);
      firstImage = 'assets/images/logo1.png';
      secondImage = 'assets/images/logo2.png';
    } else {
      darkMode = true;
      firstColor = Color(0XFFe5e5e5);
      secondColor = Color(0XFF212121);
      firstImage = 'assets/images/logo2.png';
      secondImage = 'assets/images/logo1.png';
    }
    notifyListeners();
  }

  void setPreTime(MyTime curTime) {
    preTime = curTime;
    notifyListeners();
  }
}
