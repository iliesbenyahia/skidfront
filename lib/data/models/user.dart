import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';

class User {

  int? id;
  String? mail;
  String? firstname;
  String? lastname;



  //Return string of relationships from API Call, needs to be converted
  static Future<User> login(String mail, String password) async {
    User futureUser = new User();
    final response = await http.post(Uri.parse(API.getUrlWithRoute("user/login/")),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "mail": mail,
        "password" : password,
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      futureUser.id = jsonData["id"];
      futureUser.mail = jsonData["mail"];
      return futureUser;
    } else {
      futureUser.id = -1;
      return futureUser;
    }
  }


}