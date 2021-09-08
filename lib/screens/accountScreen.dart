import 'package:flutter/material.dart';
import 'package:yallawin/constant.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/reUsableCom.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static final String id = 'AccountScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  text: 'Account',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoContainer(
                      containerName: 'ID',
                      containerContent: context.read<ProviderHelper>().userId,
                      editable: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      containerName: 'Full Name',
                      containerContent: context.read<ProviderHelper>().fullName,
                      editable: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      containerName: 'Email',
                      containerContent: context.read<ProviderHelper>().email,
                      editable: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      containerName: 'Mobile',
                      containerContent: context.read<ProviderHelper>().mobile,
                      editable: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      containerName: 'Password',
                      containerContent: context.read<ProviderHelper>().password,
                      editable: true,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    MyButton(
                      buttonText: 'Save',
                      buttonColor: context.watch<ProviderHelper>().firstColor.withOpacity(0.9),
                      buttonFunction: () {},
                      textColor: context.watch<ProviderHelper>().secondColor,
                      minwidth: 1,
                    )
                  ],
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoContainer extends StatefulWidget {
  final String containerName;
  final bool editable;
  final String containerContent;

  InfoContainer(
      {required this.containerName,
      required this.editable,
      required this.containerContent});

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.containerName),
        Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: context.watch<ProviderHelper>().firstColor.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.containerContent,
                style: TextStyle(color: context.watch<ProviderHelper>().secondColor),
              ),
              InkWell(
                onTap: widget.containerName == 'ID' ? null : () {},
                child: Text(
                  'Edit',
                  style: widget.editable
                      ? TextStyle(color: context.watch<ProviderHelper>().secondColor)
                      : TextStyle(color: thirdColor),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
