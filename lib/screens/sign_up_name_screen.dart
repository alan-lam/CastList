import 'package:castlist/components/custom_text_field.dart';
import 'package:castlist/components/rounded_button.dart';
import 'package:castlist/screens/sign_up_email_screen.dart';
import 'package:flutter/material.dart';

class SignUpNameScreen extends StatefulWidget {
  static String id = 'sign_up_name_screen';

  @override
  _SignUpNameScreenState createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
  String firstName;
  String lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'What\'s your name?',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                CustomTextField(
                  label: 'First Name',
                  onChanged: (fName) {
                    firstName = fName;
                  },
                ),
                CustomTextField(
                  label: 'Last Name',
                  onChanged: (lName) {
                    lastName = lName;
                  },
                ),
                RoundedButton(
                  color: Colors.lightBlue,
                  title: 'Continue',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpEmailScreen(
                        firstName: firstName,
                      );
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
