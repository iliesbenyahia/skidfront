import 'package:flutter/material.dart';

class primaryLogo extends StatelessWidget {
  const primaryLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Ressources ',
        style: TextStyle(fontSize: 40, color: Color(0xff544cb4)),
        children: <TextSpan>[
          TextSpan(text: 'Relationnelles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
