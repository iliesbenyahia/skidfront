import 'dart:html';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/logo.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
           print('project snapshot data is: ${snapshot.data}');
          return Text("issou"); //Todo: changer ça
        }
        else {
          late String firstname = "";
          late String lastname = "";
          late String mail = "";
          if(snapshot.data != null){
            if(snapshot.data!.get("umail") != null){
              mail = snapshot.data!.getString("umail").toString();
            }
            if(snapshot.data!.get("ufirstname") != null){
              firstname = snapshot.data!.getString("ufirstname").toString();
            }
            if(snapshot.data!.get("ulastname") != null){
              lastname = snapshot.data!.getString("ulastname").toString();
            }
          }

          return Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                  ),
                  child: Column(children: [
                    primaryLogo(),
                   // Text(mail + " " + firstname + " " + lastname)
                  ],),
                ),
                ListTile(
                  title: const Text('Mon compte'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Trouver une ressource'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/searchRessource');
                  },
                ),
                ListTile(
                  title: const Text('Partager une ressource'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/upload');
                  },
                ),
                ListTile(
                  title: const Text('dev'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/ressource');
                  },
                ),

              ],
            ),
          );
        }
      },
      future: SharedPreferences.getInstance(),
    );

  }
}
