import 'package:flutter/material.dart';

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  _loginFormState createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              )),
          Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
              )),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    child: new Text("Je ne suis pas inscrit"),
                    onTap: () => {}
                )
              ],
            ),
          )
        
        ],
      ),
    );
  }
}
