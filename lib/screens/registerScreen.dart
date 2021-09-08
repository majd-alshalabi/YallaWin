import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/helper/providerHelper.dart';

import '../reUsableCom.dart';

class RegisterScreen extends StatefulWidget {
  static final String id = 'RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

final _formKey = GlobalKey<FormState>();

String errorText = '';
bool isLoading = false;

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController conPasswordController = TextEditingController();
TextEditingController referralController = TextEditingController();

FocusNode nameFocuseNode = FocusNode();
FocusNode emailFocuseNode = FocusNode();
FocusNode passwordFocuseNode = FocusNode();
FocusNode conPasswordFocuseNode = FocusNode();
FocusNode referralFocuseNode = FocusNode();

class _RegisterScreenState extends State<RegisterScreen> {
  /*@override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conPasswordController.dispose();
    referralController.dispose();
    nameFocuseNode.dispose();
    emailFocuseNode.dispose();
    passwordFocuseNode.dispose();
    conPasswordFocuseNode.dispose();
    referralFocuseNode.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 40,
            child: Column(
              children: [
                Image(
                  image: AssetImage(context.watch<ProviderHelper>().firstImage),
                  width: 2 * MediaQuery.of(context).size.width / 3,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputContainer(
                        controller: nameController,
                        valid: () {},
                        keyboardType: TextInputType.emailAddress,
                        placeHolderText: 'Full name',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: nameFocuseNode,
                        obscureTextValue: false,
                        onchange: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputContainer(
                        onchange: () {},
                        controller: emailController,
                        valid: () {},
                        obscureTextValue: false,
                        placeHolderText: 'Email',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: emailFocuseNode,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputContainer(
                        controller: passwordController,
                        valid: () {},
                        keyboardType: TextInputType.emailAddress,
                        placeHolderText: 'Password',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: passwordFocuseNode,
                        obscureTextValue: true,
                        onchange: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputContainer(
                        controller: conPasswordController,
                        valid: () {},
                        keyboardType: TextInputType.emailAddress,
                        placeHolderText: 'Confirm Password',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: conPasswordFocuseNode,
                        obscureTextValue: true,
                        onchange: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputContainer(
                        controller: referralController,
                        valid: () {},
                        keyboardType: TextInputType.emailAddress,
                        placeHolderText: 'Referral (if you have)',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: referralFocuseNode,
                        obscureTextValue: false,
                        onchange: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          errorText,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        margin: EdgeInsets.only(top: 10),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Material(
                          color: isLoading
                              ? Colors.transparent
                              : context.watch<ProviderHelper>().firstColor,
                          elevation: isLoading ? 0 : 5.0,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: MaterialButton(
                            minWidth: 2 * MediaQuery.of(context).size.width / 5,
                            onPressed: () {},
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    'Register',
                                    style: TextStyle(
                                        color: context
                                            .watch<ProviderHelper>()
                                            .secondColor),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
