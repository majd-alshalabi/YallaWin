import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/screens/loginScreen.dart';

import '../reUsableCom.dart';

class WelecomScreen extends StatelessWidget {
  static final String id = 'WelecomScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(context.watch<ProviderHelper>().firstImage),
            ),
            Text(
              'This work is not affiliated with any government organization.',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                MyButton(
                  buttonText: 'Get started',
                  buttonColor: context.watch<ProviderHelper>().firstColor,
                  buttonFunction: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  textColor: context.watch<ProviderHelper>().secondColor,
                  minwidth: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                MyButton(
                  buttonText: 'Watch how to use',
                  buttonColor: context.watch<ProviderHelper>().secondColor,
                  buttonFunction: () {},
                  textColor: context.watch<ProviderHelper>().firstColor,
                  minwidth: 1,
                ),
              ],
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
