import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class fileHelper{

  static Future<Response> getSignedURL(file) async{
    var dio = Dio();
    final response = await dio.post('http://10.0.2.2:3000/ressources/upload', data: {'fileName' : file.name, 'fileType' : lookupMimeType(file.path)});
    print(response);
    return response;
  }

  static upload(uploadFile) async {

    Response res = await getSignedURL(uploadFile);
    var uploadURL = res.data["signedRequest"];
    var fileURL = res.data["url"];
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
        print("$progressPercent %");
      },
    );

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


