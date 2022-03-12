import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/menu.dart';
import '../components/ressourceCategories.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import '../helpers/fileHelper.dart';
import '../helpers/apiHelper.dart';

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
          Expanded(child: ressourceCategories()),
          ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions:  ['jpg', 'pdf', 'gif', 'doc', 'avi', 'mp4', 'wmv', 'mkv','png']
              );
              file = result!.files.first;
              fileHelper.upload(file);
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
