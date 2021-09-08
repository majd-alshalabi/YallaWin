import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static final String yearid = 'year';
  static final String monthid = 'month';
  static final String dayid = 'day';
  static final String hourid = 'hour';
  static final String minid = 'min';
  static final String secid = 'sec';

  static Future<void> setYear(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(yearid, val);
  }

  static Future<int> getYear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(yearid) ?? -1;
  }

  static Future<void> setMonth(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(monthid, val);
  }

  static Future<int> getMonth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(monthid) ?? -1;
  }

  static Future<void> setDay(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(dayid, val);
  }

  static Future<int> getDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(dayid) ?? -1;
  }

  static Future<void> setHour(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(hourid, val);
  }

  static Future<int> getHour() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(hourid) ?? -1;
  }

  static Future<void> setMin(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(minid, val);
  }

  static Future<int> getMin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(minid) ?? -1;
  }

  static Future<void> setSec(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(secid, val);
  }

  static Future<int> getSec() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(secid) ?? -1;
  }
}
