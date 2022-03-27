import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import '../components/menu.dart';
import '../components/uploadFormWidgets/ressourceRelations.dart';
import 'package:file_picker/file_picker.dart';
import '../components/uploadFormWidgets/ressourceCategories.dart';
import 'package:provider/provider.dart';
import '../data/viewmodels/ressourceUploadForm.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../data/models/category.dart';

class ressource extends StatefulWidget {
  const ressource({Key? key}) : super(key: key);

  @override
  _ressourceState createState() => _ressourceState();
}

class _ressourceState extends State<ressource> {

  @override
  Widget build(BuildContext context) {
    final ressource = ModalRoute.of(context)!.settings.arguments as Ressource;
    print(ressource.description);
    return  Scaffold(
      appBar: AppBar(title: Text(ressource.label),),
      drawer: Menu(),
      body:
        Consumer<ressourceForm>(builder: (context, uploadForm, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  child: SelectableText(
                    ressource.label,
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),),

                ],
              ),
              SelectableText(ressource.description!),

            ],
          );
        },),

    );
  }
}

