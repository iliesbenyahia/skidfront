import 'package:flutter/material.dart';
import 'package:skidressourcesrel/components/loginForm.dart';
import 'package:skidressourcesrel/components/logo.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          primaryLogo(),
          loginForm(),

        ],
      ),
    );
  }
}
