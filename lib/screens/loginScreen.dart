import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallawin/helper/providerHelper.dart';
import 'package:yallawin/screens/registerScreen.dart';

import '../reUsableCom.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

String errorText = '';
bool isLoading = false;

TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();

FocusNode userFocuseNode = FocusNode();
FocusNode passwordFocuseNode = FocusNode();

class _LoginScreenState extends State<LoginScreen> {
  /* @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    userFocuseNode.dispose();
    passwordFocuseNode.dispose();
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
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputContainer(
                        controller: userController,
                        valid: () {},
                        keyboardType: TextInputType.emailAddress,
                        placeHolderText: 'Email',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: userFocuseNode,
                        obscureTextValue: false,
                        onchange: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputContainer(
                        onchange: () {},
                        controller: passwordController,
                        valid: () {},
                        obscureTextValue: true,
                        placeHolderText: 'Password',
                        newWidth: 4 * MediaQuery.of(context).size.width / 5,
                        focusNode: passwordFocuseNode,
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
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 10),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
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
                                    'Login',
                                    style: TextStyle(
                                        color: context
                                            .watch<ProviderHelper>()
                                            .secondColor),
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 10),
                        child: Row(
                          children: [
                            Text('New Here ?'),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.id);
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      )
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
