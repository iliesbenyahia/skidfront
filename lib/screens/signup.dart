import 'package:flutter/material.dart';
import 'package:skidressourcesrel/components/loginForm.dart';
import 'package:skidressourcesrel/components/logo.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          primaryLogo(),


        ],
      ),
    );
  }
}
