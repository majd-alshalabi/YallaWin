import 'package:dio/dio.dart';
import 'package:yallawin/helper/timeHelper.dart';

Future<MyTime> getTime() async {
  try {
    var response =
        await Dio().get('http://worldtimeapi.org/api/timezone/Asia/Damascus');
    String res = response.data['datetime'];
    MyTime myTime = MyTime(
      int.parse(res.substring(0, 4)),
      int.parse(res.substring(5, 7)),
      int.parse(res.substring(8, 10)),
      int.parse(res.substring(11, 13)),
      int.parse(res.substring(14, 16)),
      int.parse(res.substring(17, 19)),
    );
    return myTime;
  } catch (e) {
    print(e);
    return MyTime(-1, -1, -1, -1, -1, -1);
  }
}
