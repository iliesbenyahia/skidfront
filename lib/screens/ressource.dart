import 'package:flutter/material.dart';
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
    return  Scaffold(
      appBar: AppBar(title: Text("Partage de ressources"),),
      drawer: Menu(),
      body:
        Consumer<ressourceForm>(builder: (context, uploadForm, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: [ Expanded(child:
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Intitulé de la ressource',
                ),
                onChanged: (text){
                  uploadForm.setTitle = text;
                },
              ),
              )]
              ),
              Row(children: [ Expanded(child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        uploadForm.description = text;
                      },
                      maxLines: 8,
                      decoration: InputDecoration.collapsed(hintText: "Description de la ressource (facultative)"),
                    ),
                  )
              ))],),
              Row(children: [ Expanded(child: ressourceCategories())],),
              Row(children: [ Expanded(child: ressourcesRelationships())],),
              Row(children: [ Text(uploadForm.file != null ? uploadForm.getFile!.name : "")]),
              ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions:  ['jpg', 'pdf', 'gif', 'doc', 'avi', 'mp4', 'wmv', 'mkv','png']
                  );
                  uploadForm.setFile = result!.files.first;
                },
                child: Text("Choisir un fichier"),

              ),
              ElevatedButton(
                onPressed: (){
                    uploadForm.submit();
                  },
                child: Text("Créer ma ressource"),
              ),

            ],
          );
        },),

    );
  }
}

