import 'package:flutter/material.dart';
import 'package:skidressourcesrel/components/loginForm.dart';
import 'package:skidressourcesrel/components/logo.dart';
import 'package:skidressourcesrel/components/searchFormWidgets/searchBar.dart';
import 'package:skidressourcesrel/components/searchFormWidgets/ressourcesList.dart';
import '../components/menu.dart';

class ressourcesSearch extends StatefulWidget {
  const ressourcesSearch({Key? key}) : super(key: key);

  @override
  _ressourcesSearchState createState() => _ressourcesSearchState();
}

class _ressourcesSearchState extends State<ressourcesSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trouver une ressource"),),
      drawer: Menu(),
      body: new Stack(
        children: [
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("skid.png"), fit: BoxFit.contain, opacity: 0.1),
            ),
          ),
          Column(
            children: [
              searchBar(),
              ressourcesList()
            ],
          ),

        ],

      ),


  );

  }
}
