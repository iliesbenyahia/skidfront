import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceCard.dart';
import '../components/menu.dart';
import '../components/uploadFormWidgets/ressourceRelations.dart';
import 'package:file_picker/file_picker.dart';
import '../components/uploadFormWidgets/ressourceCategories.dart';
import '../components/ressourcesActions.dart';
import '../components/ressourcesRelationshipsBadges.dart';
import 'package:provider/provider.dart';
import '../data/viewmodels/ressourceUploadForm.dart';
import '../data/viewmodels/ressourceCard.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import '../data/models/category.dart';

class ressource extends StatefulWidget {
  const ressource({Key? key}) : super(key: key);

  @override
  _ressourceState createState() => _ressourceState();
}

class _ressourceState extends State<ressource> {

  @override
  Widget build(BuildContext context) {
    Ressource ressource = Ressource();
    List<Widget> actionButtons = [

    ];
    ressource.label = "Titre";
    ressource.description = "description de la ressource";
    ressource.url = "";
    if(ModalRoute.of(context)!.settings.arguments != null) {
       ressource = ModalRoute
          .of(context)!
          .settings
          .arguments as Ressource;
    }
    Provider.of<ressourceCard>(context, listen: false).setRessource = ressource;
    return  Scaffold(
      appBar: AppBar(title: Text(""),),
      drawer: Menu(),
      body:
        Consumer<ressourceCard>(builder: (context, ressourceCard, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  child: SelectableText(
                    ressourceCard.getRessource!.label,
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),),

                ],
              ),
              relationshipBadges(relationships: ressourceCard.getRessource!.relationshipsArray),
              SelectableText(ressourceCard.getRessource!.description!),
              Card(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon : Icon(
                      Icons.report,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                    iconSize: 50,
                    padding: EdgeInsets.all(10),
                  ),
                  IconButton(
                    icon : Icon(
                      Icons.star_border,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                    iconSize: 50,
                    padding: EdgeInsets.all(10),
                  ),
                  if(ressource.url != "" && ressource.url != null)
                  IconButton(
                    icon : Icon(
                      Icons.download_outlined,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                    iconSize: 50,
                    padding: EdgeInsets.all(10),
                  ),
                  IconButton(
                    icon : Icon(
                      Icons.comment,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                    iconSize: 50,
                    padding: EdgeInsets.all(10),
                  ),

                ],
              ),)
            ],
          );
        },),

    );
  }
}

