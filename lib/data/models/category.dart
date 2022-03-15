import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';

class Category {

  late int id;
  late String label;

  static Future<List<Map<String, dynamic>>> fetchAllCategories() async {

    List<Map<String, dynamic>> categs = [];

    late String? data;
    final response = await http
        .get(Uri.parse(API.getUrlWithRoute("categories")));
    if (response.statusCode == 200) {
      data = response.body;
      var jsondata = json.decode(data);

      if (data != null) {
        for (var categ in jsondata) {
          categs.add({
            'value': categ["id"],
            'label': categ['label']
          });
        }
      }
    } else {
      throw Exception('Failed to fetch categories');
    }
    return categs;
  }

}