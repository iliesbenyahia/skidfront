import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';

class Category {

  late int id;
  late String label;

  static Future<String> fetchAllCategories() async {
    late String? data;
    final response = await http
        .get(Uri.parse(API.getUrlWithRoute("categories")));
    if (response.statusCode == 200) {
      data = response.body;
    } else {
      throw Exception('Failed to fetch categories');
    }
    return data;
  }

}