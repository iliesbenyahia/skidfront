import 'dart:convert';
//import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import '../components/logo.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../helpers/apiHelper.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Relationship {
  final int? id;
  final String? type;

  Relationship({
    this.id,
    this.type,
  });
}

Future<String> fetchRelationships() async {
  late String? data;
  final response = await http
      .get(Uri.parse(API.getUrlWithRoute("relationships")));
  if (response.statusCode == 200) {
    data = response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load relationships');
  }
  return data;
}

class ressourcesRelationships extends StatefulWidget {
  const ressourcesRelationships({Key? key}) : super(key: key);

  @override
  _ressourcesRelationshipsState createState() => _ressourcesRelationshipsState();
}

class _ressourcesRelationshipsState extends State<ressourcesRelationships> {

  late Future<String> relationshipString;



  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    relationshipString = fetchRelationships();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Text(""); //todo loading
        }
        else {
          var data = json.decode(projectSnap.data.toString());
          if(data != null) {
          List<Relationship> rellist = [];
          for(var categ in data){
            rellist.add(Relationship(id: categ["id"], type: categ["type"]));
          }
          final items = rellist.map((relationship) => MultiSelectItem(relationship.id, relationship.type!) ).toList();
          List<Map<String, dynamic>> relationships = [];
          return MultiSelectDialogField(items: items,
            title: Text("Relation(s) concernée(s)"),
            selectedColor: Colors.purple,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              //borderRadius: BorderRadius.all(Radius.circular(40)),
              // border: Border.all(
              //   color: Colors.purple,
              //   width: 2,
              // ),
            ),
            buttonIcon: Icon(
              Icons.category,
              color: Colors.purple,
            ),
            buttonText: Text(
              "Type(s) de relations concernée(s)",
              style: TextStyle(
                color: Colors.purple[800],
                fontSize: 16,
              ),
            ),
            onConfirm: (results) {
              //_selectedAnimals = results;
            },);
        }
        else{
          return Text(""); //todo loading
        }




        }
      },
      future: fetchRelationships(),
    );




  }
}

