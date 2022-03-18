import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:select_form_field/select_form_field.dart';


class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
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
            ),
          ),
        ),
        Expanded(
          flex: 1,
            child:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child:
                SelectFormField(
                  type: SelectFormFieldType.dropdown,
                  // or can be dialog
                  initialValue: "",
                  hintText: "Catégorie",
                  labelText: "",
                  items: [],
                  onChanged: (val) {
                    setState(() {});
                  },
                  onSaved: (val) {
                    setState(() {});
                  },
                ),)
            ),
      ],
    ));
  }
}
