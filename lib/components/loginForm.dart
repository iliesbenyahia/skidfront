import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Padding(padding: EdgeInsets.all(4), child: Center(
      child: Container(
        width: 500,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onChanged: (val) {
                setState(() {
                  mail = val;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        minimumSize: const Size.fromHeight(50)),

                    onPressed: () async {
                      if (mail != null && password != null) {
                        User user = await User.login(mail!, password!);
                        if (user.id! > 0) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setInt('uid', user.id!);
                          if(user.firstname != null){
                            await prefs.setString('ufirstname', user.firstname!);
                          }
                          if(user.lastname != null){
                            await prefs.setString('ulastname', user.lastname!);
                          }
                          if(user.mail != null){
                            await prefs.setString('umail', user.mail!);
                          }
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/home');

                        } else {
                          final snackBar = SnackBar(
                            content: const Text(
                                'Identifiants incorrects, veuillez réessayer.'),
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
                      } else {
                        final snackBar = SnackBar(
                          content:
                          const Text('Tous les identifiants sont requis.'),
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
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pas encore de compte ?"),
                        InkWell(
                          child: Text("Je m'inscris !",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff544cb4),
                          ),),
                          onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/signup');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
