import 'package:flutter/material.dart';
import 'package:hse_app/pages/home_page.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'login_page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 8.0),
              RoundedTextField(
                hintText: 'Enter your email',
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 8.0),
              RoundedTextField(
                hintText: 'Enter your password.',
                isPassword: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // Check if email and password are not empty
                    if (email.isEmpty || password.isEmpty) {
                      throw FirebaseAuthException(
                        message: "Email and Password cannot be empty",
                        code: "empty-fields",
                      );
                    }

                    final UserCredential userCredential = await _auth
                        .signInWithEmailAndPassword(
                          email: email.trim(),
                          password: password.trim(),
                        );

                    if (userCredential.user != null) {
                      Navigator.pushNamed(context, HomePage.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    String errorMessage;
                    if (e.code == 'user-not-found') {
                      errorMessage = 'No user found for that email.';
                    } else if (e.code == 'wrong-password') {
                      errorMessage = 'Wrong password provided.';
                    } else {
                      errorMessage = e.message ?? 'An error occurred.';
                    }

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(errorMessage)));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('An unknown error occurred.')),
                    );
                  } finally {
                    setState(() {
                      showSpinner = false;
                    });
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
