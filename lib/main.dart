import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/constant.dart';
import 'package:yallawin/screens/accountScreen.dart';
import 'package:yallawin/screens/extraPointsScreen.dart';
import 'package:yallawin/screens/loginScreen.dart';
import 'package:yallawin/screens/mainScreen.dart';
import 'package:yallawin/screens/redeem.dart';
import 'package:yallawin/screens/registerScreen.dart';
import 'package:yallawin/screens/welecomScreen.dart';
import 'helper/providerHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: firstColor,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(
    ChangeNotifierProvider<ProviderHelper>(
      create: (context) => ProviderHelper(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme:
            IconThemeData(color: context.watch<ProviderHelper>().firstColor),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: context.watch<ProviderHelper>().firstColor,
        ),
        canvasColor: context.watch<ProviderHelper>().secondColor,
        primaryColor: context.watch<ProviderHelper>().secondColor,
        fontFamily: secondFont,
        scaffoldBackgroundColor: context.watch<ProviderHelper>().secondColor,
      ),
      routes: {
        WelecomScreen.id: (BuildContext context) => WelecomScreen(),
        LoginScreen.id: (BuildContext context) => LoginScreen(),
        RegisterScreen.id: (BuildContext context) => RegisterScreen(),
        AccountScreen.id: (BuildContext context) => AccountScreen(),
        ExtraPointsScreen.id: (BuildContext context) => ExtraPointsScreen(),
        MainScreen.id: (BuildContext context) => MainScreen(),
        RedeemScreen.id: (BuildContext context) => RedeemScreen(),
      },
      home: MainScreen(),
    );
  }
}
