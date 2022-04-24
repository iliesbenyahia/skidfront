
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
              SizedBox(
              height: 258,
              child: DrawerHeader(
                decoration: BoxDecoration(
                ),
                child: Column(children: [
                  Image.asset("assets/skidlogo.png",scale: 3,),
                  primaryLogo(),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Text(mail + " " + firstname + " " + lastname)
                ),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(0.0),
              ),

              ),


                ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: const Text('Mon compte'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search),
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
                  leading: Icon(Icons.drive_folder_upload),
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
                  leading: Icon(Icons.bookmark_border),
                  title: const Text('Mes ressources'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/ressource');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite_outlined),
                  title: const Text('Mes favoris'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/ressource');
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
