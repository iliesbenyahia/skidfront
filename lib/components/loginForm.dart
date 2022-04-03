import 'package:flutter/material.dart';
import '../data/models/user.dart';

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  _loginFormState createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  String? mail;
  String? password;
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
                onChanged: (val) {
                  setState(() {
                    mail = val;
                  });
                },
              )),
          Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              )),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    child: new Text("Je ne suis pas inscrit"),

                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              print(mail);
              print(password);
              if(mail != null || password != null) {
                User user = await User.login(mail!, password!);
                if (user.id! > 0) {
                  Navigator.pushNamed(context, '/home');
                }
                else{
                  final snackBar = SnackBar(
                    content: const Text('Identifiants incorrects, veuillez réessayer'),
                    action: SnackBarAction(
                      label: 'Confirmer',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
              else{
                final snackBar = SnackBar(
                  content: const Text('Veuillez saisir des identifiants'),
                  action: SnackBarAction(
                    label: 'Confirmer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              //;
            }, //Todo login with API
            child: Text("Se connecter"),
          )
        
        ],
      ),
    );
  }
}
