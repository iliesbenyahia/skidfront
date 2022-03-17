import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'dart:io' as io;
import 'dart:async' as io;
import 'apiHelper.dart';
import 'package:http_parser/http_parser.dart';

class fileHelper {

  static Future<Response> getSignedURL(file) async {
    var dio = Dio();
    final response = await dio.post(API.getUrlWithRoute("ressources/upload"),
        data: {'fileName': file.name});
    return response;
  }

  static Future<bool> upload(uploadFile) async {
    bool uploaded = false;
    final res = await getSignedURL(uploadFile);
    if (kIsWeb) {
      var url = Uri.parse(res.data["signedRequest"]);
      var response = await http.put(url, body: uploadFile.bytes);
      if(response.statusCode == 200){
        uploaded = true;
      }
    }
    else {
      var uploadURL = res.data["signedRequest"];
      var uploadFileURL = res.data["url"];
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
          if (progressPercent == 100) {
            print("ISSOUUPLOADED");
          }
          print("$progressPercent %");
        },
      );

    }

    return uploaded;
  }
}



