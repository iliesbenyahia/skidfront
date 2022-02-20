import 'package:flutter/material.dart';

class primaryLogo extends StatelessWidget {
  const primaryLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Ressources ',
        style: TextStyle(fontSize: 40, color: Colors.purple),
        children: <TextSpan>[
          TextSpan(text: 'Relationnelles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ],
      ),
    );
  }
}
