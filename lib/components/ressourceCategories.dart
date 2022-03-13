import 'dart:convert';
//import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import '../components/logo.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../helpers/apiHelper.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/multi_select_flutter.dart';


Future<String> fetchCategories() async {

  late String? data;



  final response = await http
      .get(Uri.parse(API.getUrlWithRoute("categories")));
  if (response.statusCode == 200) {
    data = response.body;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  return data;
}

class ressourceCategories extends StatefulWidget {
  const ressourceCategories({Key? key}) : super(key: key);

  @override
  _ressourceCategoriesState createState() => _ressourceCategoriesState();
}

class _ressourceCategoriesState extends State<ressourceCategories> {

  late Future<String> categoriesString;



  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    categoriesString = fetchCategories();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Text("issou");
        }
        else {

          var data = json.decode(projectSnap.data.toString()) ;

          List<Map<String, dynamic>> categs = [];
          if(data != null) {
            for (var categ in data) {
              categs.add({
                'value': categ["id"],
                'label': categ['title']
              });
            }
          }

          return SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            initialValue: '1',
            icon: Icon(Icons.description),
            labelText: 'Categorie',
            items: categs,
            onChanged: (val) => setState(() {
              categoriesString = fetchCategories();
            }),
            onSaved: (val) => print(val),
          );


        }
      },
      future: fetchCategories(),
    );




  }
}

