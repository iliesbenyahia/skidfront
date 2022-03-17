import 'dart:convert';
//import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceUploadForm.dart';
import '../logo.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../../helpers/apiHelper.dart';
import 'package:http/http.dart' as http;
import '../../data/models/category.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class ressourceCategories extends StatefulWidget {
  const ressourceCategories({Key? key}) : super(key: key);

  @override
  _ressourceCategoriesState createState() => _ressourceCategoriesState();
}

class _ressourceCategoriesState extends State<ressourceCategories> {
  String? selectedCategoryID;
  late Future<List<Map<String, dynamic>>> categories;
  
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    categories = Category.fetchAllCategories();
  }
  
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Map<String, dynamic>>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
            //print('project snapshot data is: ${snapshot.data}');
          return Text("issou"); //Todo: changer ça
        }
        else {
          //print(snapshot.data.runtimeType);
          return SelectFormField(
            type: SelectFormFieldType.dialog, // or can be dialog
            initialValue: Provider.of<ressourceForm>(context, listen: false).getCategoryID.toString(),
            icon: Icon(Icons.description),
            labelText: 'Categorie',
            items: snapshot.data,
            onChanged: (val) {
                setState(() {
                  Provider.of<ressourceForm>(context, listen: false).setCategoryID = int.parse(val);
                });
            },
            onSaved: (val) {
                setState(() {
                    Provider.of<ressourceForm>(context, listen: false).setCategoryID = int.parse(val!);
                });
            },
          );
        }
      },
      future: Category.fetchAllCategories(),
    );



  }
}
