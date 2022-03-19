import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:skidressourcesrel/data/models/category.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceSearchForm.dart';


class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {

  String? selectedCategoryID;
  late Future<List<Map<String, dynamic>>> categories;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    categories = Category.fetchAllCategories();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Consumer<ressourceSearchForm>(builder: (context, searchForm, child)
    {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entrer un terme',
                ),
                enableSuggestions: true,
                onChanged: (val) {
                  searchForm.setSearchTerm = val;
                  },
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.hasData == null) {
                      //print('project snapshot data is: ${snapshot.data}');
                      return Text("issou"); //Todo: changer ça
                    }
                    else {
                      //print(snapshot.data.runtimeType);
                      return SelectFormField(
                        type: SelectFormFieldType.dropdown, // or can be dialog
                        initialValue: searchForm.getCategoryID,
                        items: snapshot.data,
                        labelText: 'Categorie',
                        onChanged: (val) {
                            searchForm.setCategoryID = val;
                        },
                        onSaved: (val) {
                            searchForm.setCategoryID = val!;
                        },
                      );
                    }
                  },
                  future: Category.fetchAllCategories(),
                )
              )),
        ],
      );
    })
    );

  }
}
