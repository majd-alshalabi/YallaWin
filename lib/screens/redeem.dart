import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/reUsableCom.dart';

class RedeemScreen extends StatelessWidget {
  static final String id = 'RedeemScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageHeader(text: 'Redeem'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Text('Redeem Balance (MTN/SYR)'),
                    SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      buttonText: '100 Syriatel or MTN',
                      buttonColor: context.watch<ProviderHelper>().firstColor,
                      buttonFunction: () {},
                      textColor: context.watch<ProviderHelper>().secondColor,
                      minwidth: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: MyButton(
                        buttonText: '100 Syriatel or MTN',
                        buttonColor: context.watch<ProviderHelper>().firstColor,
                        buttonFunction: () {},
                        textColor: context.watch<ProviderHelper>().secondColor,
                        minwidth: MediaQuery.of(context).size.width,
                      ),
                    ),
                    MyButton(
                      buttonText: '100 Syriatel or MTN',
                      buttonColor: context.watch<ProviderHelper>().firstColor,
                      buttonFunction: () {},
                      textColor: context.watch<ProviderHelper>().secondColor,
                      minwidth: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Text('Google play Gift Card'),
                    SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      buttonText: '5\$ Google Card',
                      buttonColor: context.watch<ProviderHelper>().firstColor,
                      buttonFunction: () {},
                      textColor: context.watch<ProviderHelper>().secondColor,
                      minwidth: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: MyButton(
                        buttonText: '10\$ Google Card',
                        buttonColor: context.watch<ProviderHelper>().firstColor,
                        buttonFunction: () {},
                        textColor: context.watch<ProviderHelper>().secondColor,
                        minwidth: MediaQuery.of(context).size.width,
                      ),
                    ),
                    MyButton(
                      buttonText: '25\$ Google Card',
                      buttonColor: context.watch<ProviderHelper>().firstColor,
                      buttonFunction: () {},
                      textColor: context.watch<ProviderHelper>().secondColor,
                      minwidth: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
              MyButton(
                buttonText: 'Cash(Soon)',
                buttonColor: context.watch<ProviderHelper>().secondColor,
                buttonFunction: () {},
                textColor: context.watch<ProviderHelper>().firstColor,
                minwidth: MediaQuery.of(context).size.width / 2,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
