import 'package:flutter/material.dart';
import 'package:skidressourcesrel/components/loginForm.dart';
import 'package:skidressourcesrel/components/logo.dart';
import 'package:skidressourcesrel/components/searchBar.dart';
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
      body:
         Column(
           children: [
             searchBar(),
           ],
        ),

  );

  }
}
