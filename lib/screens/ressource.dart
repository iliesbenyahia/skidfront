import 'dart:io';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceCard.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sn_progress_dialog/completed.dart';
import '../components/menu.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../components/ressourcesRelationshipsBadges.dart';
import 'package:provider/provider.dart';
import '../data/viewmodels/ressourceCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ressource extends StatefulWidget {
  const ressource({Key? key}) : super(key: key);

  @override
  _ressourceState createState() => _ressourceState();
}

class _ressourceState extends State<ressource> {

  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    Directory _path = await getApplicationDocumentsDirectory();

    String _localPath = _path.path + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    path = _localPath;
  }




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
                      ressourceCard.getRessource!.isFav == 1 ? Icons.star_outlined : Icons.star_border,
                      color: ressourceCard.getRessource!.isFav == 1 ? Colors.yellow : Colors.purple,
                    ),
                    onPressed: () async {
                      if(ressourceCard.getRessource!.isFav == 1){

                        final snackBar = SnackBar(
                          content: const Text(
                              'Retiré des favoris !'),
                          action: SnackBarAction(
                            label: 'Confirmer',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        await ressourceCard.removeFromFav();
                      }
                      else{

                        final snackBar = SnackBar(
                          content: const Text(
                              'Ajouté aux favoris !'),
                          action: SnackBarAction(
                            label: 'Confirmer',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        await ressourceCard.addToFav();
                      }
                    },
                    iconSize: 50,
                    padding: EdgeInsets.all(10),
                  ),
                  if(ressource.url != "" && ressource.url != null)
                  IconButton(
                    icon : Icon(
                      Icons.download_outlined,
                      color: Colors.purple,
                    ),
                    onPressed: () async {

                      if(kIsWeb) {
                        if (await canLaunch(ressource.url!)) {
                          await launch((ressource.url!));
                        }
                        else {
                          // can't launch url, there is some error
                          throw "Could not launch $ressource.url!";
                        }
                      }
                      else{
                        ProgressDialog pd = ProgressDialog(context: context);
                        pd.show(
                            max: 100, msg: "Téléchargement de la ressource",
                            msgMaxLines: 2,
                            progressType: ProgressType.normal,
                            completed: Completed(completedMsg: "Ressource téléchargée !"),
                            progressValueColor: Colors.purple,
                            progressBgColor: Colors.white70,

                        );
                        print("toto");
                        options = DownloaderUtils(
                          progressCallback: (current, total) {
                            final progress = (current / total) * 100;
                            print('Downloading: $progress');
                            pd.update(value: progress.round());

                          },
                          file: File('$path/${ressource.filename}'),
                          progress: ProgressImplementation(),
                          onDone: () async {
                            pd.close();
                            await OpenFile.open('$path/${ressource.filename}');
                            //     .then((value) {
                            //   // delete the file.
                            //   //File f = File('$path/${ressource.filename}');
                            //   //f.delete();
                            // });
                          },
                          deleteOnCancel: true,
                        );
                        core = await Flowder.download(
                          ressource.url!,
                          options,
                        );

                      }

                    },
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

