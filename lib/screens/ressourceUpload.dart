import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../components/menu.dart';
import '../components/uploadFormWidgets/ressourceRelations.dart';
import 'package:file_picker/file_picker.dart';
import '../components/uploadFormWidgets/ressourceCategories.dart';
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceUploadForm.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../data/models/category.dart';

class ressourceUpload extends StatefulWidget {
  const ressourceUpload({Key? key}) : super(key: key);

  @override
  _ressourceUploadState createState() => _ressourceUploadState();
}

class _ressourceUploadState extends State<ressourceUpload> {

  _normalProgress({required context}) async {
    /// Create progress dialog


    /// Set options
    /// Max and msg required

    // print("hihi : ");
    // print(Provider.of<ressourceForm>(context, listen: false).getProgressPercent.toInt());
    // print(Provider.of<ressourceForm>(context, listen: false).getProgressPercent.toInt().runtimeType);
    // pd.update(value: Provider.of<ressourceForm>(context, listen: false).getProgressPercent.toInt());
    int i = 0;
    while (i < 100) {
      /// You don't need to update state, just pass the value.
      /// Only value required

      i = Provider.of<ressourceForm>(context, listen: false).getProgressPercent.toInt();
       Future.delayed(Duration(milliseconds: 100));
    }
    print(Provider.of<ressourceForm>(context, listen: false).getProgressPercent);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Partage de ressources"),),
      drawer: Menu(),
      body:
        Consumer<ressourceForm>(builder: (context, uploadForm, child) {
          return SingleChildScrollView(
            child:
            Column(
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
                    ProgressDialog pd = ProgressDialog(context: context);
                    uploadForm.submit(context: context, processDialog: pd);
                  },
                  child: Text("Créer ma ressource"),
                ),

              ],
            )
            ,
          );;
        },
        ),

    );
  }
}

