import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/models/category.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceSearchForm.dart';
import '../ressourcePreview.dart';

class ressourcesList extends StatefulWidget {
  const ressourcesList({Key? key}) : super(key: key);

  @override
  _ressourcesListState createState() => _ressourcesListState();
}

class _ressourcesListState extends State<ressourcesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Consumer<ressourceSearchForm>(builder: (context, searchForm, child)
        {
          return Expanded(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                      child: FutureBuilder<List<Ressource>>(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.none &&
                              snapshot.hasData == null) {
                            //print('project snapshot data is: ${snapshot.data}');
                            return Text("issou"); //Todo: changer ça
                          }
                          else {
                            print(snapshot.data);
                            return ListView.builder(
                              itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                          itemBuilder: (context, index) {
                                  if(
                                  snapshot.data![index].label.contains(new RegExp(searchForm.getSearchTerm!, caseSensitive: false))
                                  ||
                                      snapshot.data![index].description!.contains(new RegExp(searchForm.getSearchTerm!, caseSensitive: false))
                                  ){
                                    return ressourcePreview(ressource: snapshot.data![index]);
                                  }
                                  else{
                                    return SizedBox.shrink();
                                  }

                          },
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                        );
                      }
                        },
                        future: searchForm.fetchRessourcesCollection(),
                      )
                  ,));
        })
    );
  }
}
