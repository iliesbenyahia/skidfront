import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceUploadForm.dart';
import 'package:skidressourcesrel/screens/ressource.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
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

  static Future<bool> upload({required uploadFile, required String uploadURL, ProgressDialog? progressDialog}) async {
    bool uploaded = false;

    if(progressDialog != null) {
      progressDialog.show(
        max: 100,
        progressType: ProgressType.normal,
        progressValueColor: Color(0xff544cb4),
        progressBgColor: Colors.white70,
        msg: 'Création de la ressource en cours',
        msgMaxLines: 2,
      );
    }

    if (kIsWeb) {
      var url = Uri.parse(uploadURL);
      var response = await http.put(url, body: uploadFile.bytes);
      var dio = new Dio();


      if(response.statusCode == 200){
        uploaded = true;
        if(progressDialog != null) {
          progressDialog.close();
        }

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
          print("$progressPercent% of upload");
          if(progressDialog != null) {
            progressDialog.update(value: progressPercent.round());
          }
          if (progressPercent == 100) {
            uploaded = true;
            if(progressDialog != null) {
              progressDialog.close();
            }

          }
          //print("$progressPercent %");
        },
      );

    }

    return uploaded;
  }
}



