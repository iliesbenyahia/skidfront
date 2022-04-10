import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';

class User {

  int? id;
  String? mail;
  String? firstname;
  String? lastname;


   /**
   * static login function, takes user's mail and password and returns and id >0 if Ok, < 0 if Nok
   *
   * @param label text for label of form
   */
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
    } else {
      futureUser.id = -1;
    }
    return futureUser;
  }


}