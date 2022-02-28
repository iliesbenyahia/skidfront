import 'dart:convert';
import 'package:file/local.dart';
import 'package:file/memory.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:file/file.dart';
import 'dart:io' as io;
import 'package:http/http.dart' as http;

class fileHelper{

  static Future<Response> getSignedURL(file) async{
    var dio = Dio();
    // final response = await dio.post('http://10.0.2.2:3000/ressources/upload', data: {'fileName' : file.name});
    // return response;

    final response = await dio.get('http://localhost:3000/user');
    return response;
    // return await http.post(
    //   Uri.parse('http://localhost:3000/ressources/upload'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'fileName': file.name,
    //   }),
    // );

  }

  static upload(uploadFile) async {
     final res = await getSignedURL(uploadFile);
     print(res.data);
    // print("issoudeska");
    // var uploadURL = res.data["signedRequest"];
    // print(uploadURL);
    // var fileURL = res.data["url"];
    // var file = io.File(uploadFile.path);
    // var dio = new Dio();
    // await dio.put(
    //   uploadURL,
    //   data: file.openRead(),
    //   options: Options(
    //     headers: {
    //       "Content-Length": file.lengthSync(),
    //     },
    //   ),
    // );

  }
   



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


