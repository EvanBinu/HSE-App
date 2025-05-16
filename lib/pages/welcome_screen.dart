import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'HSE App',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900),
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegisterPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
