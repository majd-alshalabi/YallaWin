class MyTime {
  int year, month, day, hour, min, sec;
  MyTime(this.year, this.month, this.day, this.hour, this.min, this.sec);

  static int comperTime(MyTime preTime, MyTime curTime) {
    if (preTime.year == -1 || curTime.year == -1) return -1;

    if (curTime.year - preTime.year >= 2)
      return -2;
    else {
      int month = curTime.year > preTime.year
          ? 12 - preTime.month + curTime.month
          : curTime.month - preTime.month;
      if (month >= 2)
        return -2;
      else {
        int day = curTime.month > preTime.month
            ? DateTime(preTime.year, preTime.month + 1, 0).day -
                preTime.day +
                curTime.day
            : curTime.day - preTime.day;

        if (day >= 2)
          return -2;
        else {
          int hour = curTime.day > preTime.day
              ? 24 - preTime.hour + curTime.hour
              : curTime.hour - preTime.hour;

          if (hour > 4)
            return -2;
          else {
            int sec = hour > 1 ? (hour - 1) * 3600 : 0;
            sec += hour >= 1
                ? (60 - preTime.min + curTime.min) > 0
                    ? (60 - preTime.min + curTime.min - 1) * 60
                    : 0
                : (curTime.min - preTime.min) > 0
                    ? (curTime.min - preTime.min - 1) * 60
                    : 0;
            sec += preTime.min == curTime.min
                ? curTime.sec - preTime.sec
                : 60 - preTime.sec + curTime.sec;

            if (sec > 14400)
              return -2;
            else
              return 14400 - sec;
          }
        }
      }
    }
  }
}
