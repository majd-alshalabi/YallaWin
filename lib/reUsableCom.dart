import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/screens/accountScreen.dart';
import 'package:yallawin/screens/extraPointsScreen.dart';
import 'package:yallawin/screens/redeem.dart';
import 'package:yallawin/screens/welecomScreen.dart';

import 'constant.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Function buttonFunction;
  final Color textColor;
  final double minwidth;

  MyButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.buttonFunction,
      required this.textColor,
      required this.minwidth});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      elevation: 5.0,
      child: MaterialButton(
        minWidth: minwidth,
        onPressed: () {
          buttonFunction();
        },
        height: 42.0,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class InputContainer extends StatefulWidget {
  final String placeHolderText;
  final double newWidth;
  final TextEditingController controller;
  final bool obscureTextValue;
  final keyboardType;
  final Function valid;
  final Function onchange;
  final FocusNode focusNode;

  InputContainer({
    required this.placeHolderText,
    required this.newWidth,
    required this.controller,
    required this.obscureTextValue,
    this.keyboardType,
    required this.valid,
    required this.onchange,
    required this.focusNode,
  });
  @override
  _InputContainerState createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.newWidth,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        onTap: () {
          setState(() {
            FocusScope.of(context).requestFocus(widget.focusNode);
          });
        },
        focusNode: widget.focusNode,
        onChanged: widget.onchange(),
        textInputAction: TextInputAction.next,
        validator: widget.valid(),
        obscureText: widget.obscureTextValue,
        keyboardType: widget.keyboardType == null
            ? TextInputType.text
            : widget.keyboardType,
        controller: widget.controller,
        cursorColor: context.watch<ProviderHelper>().firstColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: widget.placeHolderText == 'Referral (if you have)'
              ? widget.focusNode.hasFocus
                  ? 'Referral'
                  : widget.placeHolderText
              : widget.placeHolderText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.watch<ProviderHelper>().firstColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                width: 1, color: context.watch<ProviderHelper>().firstColor),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.watch<ProviderHelper>().firstColor,
              width: 1.0,
            ),
          ),
          labelStyle: TextStyle(
              color: widget.focusNode.hasFocus
                  ? context.watch<ProviderHelper>().firstColor
                  : thirdColor),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copyright,
            size: 10,
          ),
          Container(
            child: RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 12,
                  color: thirdColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Copyright 2022 ',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  TextSpan(
                    text: 'Hasan Ahmad ',
                    style: TextStyle(
                      color: context.watch<ProviderHelper>().firstColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                      text: 'all Rights Reserved',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  final String text;

  const PageHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 30),
          ),
          Image(
            image: AssetImage(context.watch<ProviderHelper>().firstImage),
            width: MediaQuery.of(context).size.width / 2,
          )
        ],
      ),
    );
  }
}

class MainDrawar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: context.watch<ProviderHelper>().firstColor,
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Image(
                      image: AssetImage(
                          context.watch<ProviderHelper>().secondImage),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.read<ProviderHelper>().fullName,
                          style: TextStyle(
                              color:
                                  context.watch<ProviderHelper>().secondColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your Points : 300P',
                          style: TextStyle(
                              color:
                                  context.watch<ProviderHelper>().secondColor,
                              fontSize: 10),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                DrawarItem(
                  ontap: () {
                    Navigator.pushNamed(context, AccountScreen.id);
                  },
                  text: 'Account',
                  myIcon: Icons.manage_accounts,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                DrawarItem(
                  ontap: () {
                    Navigator.pushNamed(context, ExtraPointsScreen.id);
                  },
                  text: 'Extra Points',
                  myIcon: Icons.point_of_sale,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                DrawarItem(
                  ontap: () {
                    Navigator.pushNamed(context, RedeemScreen.id);
                  },
                  text: 'Redeem',
                  myIcon: Icons.redeem,
                ),
              ],
            ),
          ),
          DrawarItem(
            ontap: () {
              Navigator.pushReplacementNamed(context, WelecomScreen.id);
            },
            text: 'Log out',
            myIcon: Icons.logout,
          )
        ],
      ),
    );
  }
}

class DrawarItem extends StatelessWidget {
  final String text;
  final IconData myIcon;
  final Function ontap;
  const DrawarItem(
      {required this.text, required this.myIcon, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: ListTile(
        title: Row(
          children: [
            Icon(myIcon),
            SizedBox(
              width: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
