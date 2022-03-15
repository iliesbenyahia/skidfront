import 'package:flutter/material.dart';
import '../components/menu.dart';
import '../components/ressourceRelations.dart';
import 'package:file_picker/file_picker.dart';
import '../components/uploadFormWidgets/ressourceCategories.dart';
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/ressourceUploadForm.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../data/models/category.dart';

class ressourceUpload extends StatefulWidget {
  const ressourceUpload({Key? key}) : super(key: key);

  @override
  _ressourceUploadState createState() => _ressourceUploadState();
}

class _ressourceUploadState extends State<ressourceUpload> {

  PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Partage de ressources"),),
      drawer: Menu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: [ Expanded(child:
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Intitulé de la ressource',
            ),
            onChanged: (text){
              Provider.of<ressourceForm>(context, listen: false).setTitle = text;
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
                    Provider.of<ressourceForm>(context, listen: false).description = text;
                  },
                  maxLines: 8,
                  decoration: InputDecoration.collapsed(hintText: "Description de la ressource (facultative)"),
                ),
              )
          ))],),
          Row(children: [ Expanded(child: ressourceCategories())],),
          Row(children: [ Expanded(child: ressourcesRelationships())],),
          ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions:  ['jpg', 'pdf', 'gif', 'doc', 'avi', 'mp4', 'wmv', 'mkv','png']
              );
              file = result!.files.first;

              //fileHelper.upload(file);
              // print('Name : ${file!.name}');
              // print(lookupMimeType(file!.path!));
            },
            child: Text("Choisir un fichier"),
          )
        ],
      ),
    );
  }
}

