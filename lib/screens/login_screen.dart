import 'package:castlist/components/custom_text_field.dart';
import 'package:castlist/components/rounded_button.dart';
import 'package:castlist/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                'Log In',
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
                title: 'Log In',
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen(firstName: '');
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
