import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'dart:io' as io;
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceUploadForm.dart';
import 'package:skidressourcesrel/screens/ressource.dart';
import 'dart:async' as io;
import 'apiHelper.dart';
import 'package:http_parser/http_parser.dart';

class fileHelper{

  static Future<Response> getSignedURL(file) async {
    var dio = Dio();
    final response = await dio.post(API.getUrlWithRoute("ressources/upload"),
        data: {'fileName': file.name});
    return response;
  }

  static Future<bool> upload(uploadFile,String uploadURL, BuildContext context) async {
    bool uploaded = false;
    if (kIsWeb) {
      var url = Uri.parse(uploadURL);
      var response = await http.put(url, body: uploadFile.bytes);
      if(response.statusCode == 200){
        uploaded = true;
      }
    }
    else {
      var file = File(uploadFile.path);
      var dio = new Dio();
      var response = await dio.put(
        uploadURL,
        data: file.openRead(),
        options: Options(
          contentType: lookupMimeType(uploadFile.path),
          headers: {
            "Content-Length": file.lengthSync(),
          },
        ),
        onSendProgress: (int sentBytes, int totalBytes) {
          double progressPercent = sentBytes / totalBytes * 100;
          Provider.of<ressourceForm>(context, listen: false).setProgessPercent = progressPercent;
          if (progressPercent == 100) {
            uploaded = true;
          }
          //print("$progressPercent %");
        },
      );

    }

    return uploaded;
  }
}



