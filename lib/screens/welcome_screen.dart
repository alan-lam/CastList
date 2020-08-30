import 'package:castlist/components/rounded_button.dart';
import 'package:castlist/screens/login_screen.dart';
import 'package:castlist/screens/sign_up_name_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'CastList',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            RoundedButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                title: 'Sign Up',
                color: Colors.blueAccent,
                onPressed: () {
                  //Go to registration screen.
                  Navigator.pushNamed(context, SignUpNameScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
