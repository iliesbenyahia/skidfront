
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/menu.dart';
import 'package:file_picker/file_picker.dart';



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
          ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions:  ['jpg', 'pdf', 'doc', 'avi', 'mp4', 'wmv', 'mkv','png']
              );
              file = result!.files.first;
              print('Bytes : ${file!.bytes}');
              print('Size : ${file!.size}');
              print('Extension : ${file!.extension}');
              print('Path : ${file!.path}');
              print('Name : ${file!.name}');
            },
            child: Text("Choisir un fichier"),
          )
        ],
      ),
    );
  }
}
