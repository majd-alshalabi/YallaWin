import 'package:flutter/material.dart';

bool getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  return data.size.shortestSide < 600 ? false : true;
}
