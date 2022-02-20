import 'package:flutter/material.dart';
import '../components/menu.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Menu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        ],
      ),
    );
  }
}
