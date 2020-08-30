import 'package:castlist/screens/home_screen.dart';
import 'package:castlist/screens/login_screen.dart';
import 'package:castlist/screens/sign_up_email_screen.dart';
import 'package:castlist/screens/sign_up_name_screen.dart';
import 'package:castlist/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CastList());
}

class CastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpNameScreen.id: (context) => SignUpNameScreen(),
        SignUpEmailScreen.id: (context) => SignUpEmailScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
