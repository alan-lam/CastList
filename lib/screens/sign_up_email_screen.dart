import 'package:castlist/components/custom_text_field.dart';
import 'package:castlist/components/rounded_button.dart';
import 'package:castlist/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpEmailScreen extends StatefulWidget {
  static String id = 'sign_up_email_screen';

  final String firstName;

  SignUpEmailScreen({this.firstName});

  @override
  _SignUpEmailScreenState createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'What\'s your email?',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              CustomTextField(
                label: 'email address',
                onChanged: (email) {
                  this.email = email;
                },
              ),
              CustomTextField(
                label: 'password',
                onChanged: (password) {
                  this.password = password;
                },
                obscureText: true,
              ),
              RoundedButton(
                color: Colors.lightBlue,
                title: 'Sign Up',
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen(firstName: widget.firstName);
                      }));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
