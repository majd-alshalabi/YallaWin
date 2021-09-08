import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/constant.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/reUsableCom.dart';

class ExtraPointsScreen extends StatefulWidget {
  static final String id = 'ExtraPointsScreen';
  @override
  _ExtraPointsScreenState createState() => _ExtraPointsScreenState();
}

TextEditingController firstController = TextEditingController();
TextEditingController secondController = TextEditingController();

FocusNode firstFocusNode = FocusNode();
FocusNode secondFocusNode = FocusNode();

class _ExtraPointsScreenState extends State<ExtraPointsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageHeader(text: 'Extra Points'),
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      child: InputContainer(
                        placeHolderText: 'Referral ID',
                        newWidth: MediaQuery.of(context).size.width / 3,
                        controller: firstController,
                        obscureTextValue: false,
                        valid: () {},
                        onchange: () {},
                        focusNode: firstFocusNode,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Follow us',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2 * MediaQuery.of(context).size.height / 5,
                        child: ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            MyButton(
                              buttonText: 'Follow the Developer on Facebook',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyButton(
                              buttonText: 'Follow us on Facebook',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyButton(
                              buttonText: 'Follow us on Twitter',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyButton(
                              buttonText: 'Join us on Telegram channel',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyButton(
                              buttonText: 'subscribe on Youtube',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyButton(
                              buttonText: 'Share video on youtube',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyButton(
                              buttonText: 'Rate us on Google Play',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Enter the accounts you followed us (Account links or username) with here and enter your ID in YallaWin',
                        style: TextStyle(color: thirdColor),
                      ),
                      Row(
                        children: [
                          InputContainer(
                              placeHolderText: '',
                              newWidth: MediaQuery.of(context).size.width / 2,
                              controller: secondController,
                              obscureTextValue: false,
                              valid: () {},
                              onchange: () {},
                              focusNode: secondFocusNode),
                          MyButton(
                              buttonText: 'Submit',
                              buttonColor: context.watch<ProviderHelper>().firstColor,
                              buttonFunction: () {},
                              textColor: context.watch<ProviderHelper>().secondColor,
                              minwidth: MediaQuery.of(context).size.width / 3)
                        ],
                      )
                    ],
                  ),
                ),
                Footer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
