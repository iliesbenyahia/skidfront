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

class fileHelper{

  static Future<Response> getSignedURL(file) async{
    var dio = Dio();
    final response = await dio.post(API.getUrlWithRoute("ressources/upload"), data: {'fileName' : file.name});
    return response;

  }

  static upload(uploadFile) async {
    final res = await getSignedURL(uploadFile);
    //print(res.data);
    //print(res.data["signedRequest"]);
     if(kIsWeb) {
       var url = Uri.parse(res.data["signedRequest"]);
       var response = await http.put(url, body: uploadFile.bytes);
     }
     else{
       var uploadURL = res.data["signedRequest"];
       var uploadFileURL = res.data["url"];
       var file = File(uploadFile.path);
       var dio = new Dio();
       await dio.put(
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
           if(progressPercent == 100){
             print("ISSOUUPLOADED");
           }
           print("$progressPercent %");
         },
       );
     }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));

     /*
    var request = new http.MultipartRequest("PUT", Uri.parse(res.data["signedRequest"]));
    request.files.add(http.MultipartFile.fromBytes("file", file.bytes,filename: file.name, contentType: MediaType.parse("image/png")));
    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    }); */

  }
    // print("issoudeska");
    // var uploadURL = res.data["signedRequest"];
    // print(uploadURL);
    // var fileURL = res.data["url"];
    // var file = io.File(uploadFile.path);
    // var dio = new Dio();



   



}


    // Response res = await getSignedURL(file);
    // var uploadURL = res.data["signedRequest"];
    // var fileURL = res.data["url"];
    //
    // var request = new http.MultipartRequest("POST", url);
    // request.fields['user'] = 'someone@somewhere.com';
    // request.files.add(http.MultipartFile.fromPath(
    //   'package',
    //   'build/package.tar.gz',
    //   contentType: new MediaType('application', 'x-tar'),
    // ));
    // request.send().then((response) {
    //   if (response.statusCode == 200) print("Uploaded!");
    // });
    //
    // var dio = Dio();
    // final response = await dio.put(uploadURL, data: formData);
    // print(response.data);


