import 'package:flutter/material.dart';
import '../screens/tab_screen.dart';
import '../screens/home_screen.dart';

import './signup_screen.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/option_button.dart';
import '../widgets/or_row.dart';
import '../widgets/social_media.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';
  String email = "";
  String password = "";
  void Authorization(String va) {
    email = va;
    print(email);
  }

  void AuthPassword(String va) {
    password = va;
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonLS(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
              ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        'Log In Continue!',
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SocialMediaLogin(
                    method: 'Login',
                  ),
                  Spacer(),
                  OrRow(),
                  Spacer(),
                  TextFields(
                    authPassword: (va) => Authorization(va),
                    authorization: (vi) => AuthPassword(vi),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kPrimaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      email == password
                          ? Navigator.of(context).pushNamed(TabScreen.routeName)
                          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Dai, this is wrong value!'),
                            ));
                      ;
                    },
                    child: Text('Login'),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  OptionButton(
                    desc: 'Don\'t have an account? ',
                    method: 'Sign Up',
                    onPressHandler: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class TextFields extends StatelessWidget {
  TextFields({
    Key key,
    this.authorization,
    this.authPassword,
  }) : super(key: key);

  final Function(dynamic) authorization;
  final Function(dynamic) authPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CustomTextField(
          hint: 'Email Address',
          onChangeTextTrigger: () => print("called"),
          onCarryString: (dynamic val) => authorization(val),
        ),
        SizedBox(
          height: getProportionateScreenHeight(16),
        ),
        CustomTextField(
          hint: 'Password',
          icon: Image.asset('assets/images/hide_icon.png'),
          onCarryString: (dynamic val) => authPassword(val),
        ),
      ],
    ));
  }
}
