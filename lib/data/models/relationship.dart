import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';

class Relationship {

  late int id;
  late String title;
  late String? description;
  late int categoryID;
  late List<int> relationships;
  late String url;

  create(String title, int categoryID, List<int> relationships, String url, String description) async{
    this.title = title;
    this.categoryID = categoryID;
    this.relationships = relationships;
    this.url = url;
    this.description = description;
    final response = await http.post(Uri.parse(API.getUrlWithRoute("ressources")),
        headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "title": title,
          "categoryID" : categoryID,
          "relationships" : relationships,
          "url" : url,
          "description" : description,
        },
    );
  }

  //Return string of relationships from API Call, needs to be converted
  Future<String> fetchRelationships() async {
    late String? data;
    final response = await http
        .get(Uri.parse(API.getUrlWithRoute("relationships")));
    if (response.statusCode == 200) {
      data = response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load relationships');
    }
    return data;
  }

}