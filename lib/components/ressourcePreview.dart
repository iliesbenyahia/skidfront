import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';

class ressourcePreview extends StatefulWidget {
  final Ressource ressource;
  final bool hidden;
  const ressourcePreview({Key? key, required this.ressource, this.hidden = false}) : super(key: key);

  @override
  _ressourcePreviewState createState() => _ressourcePreviewState();
}

class _ressourcePreviewState extends State<ressourcePreview> {
  @override
  Widget build(BuildContext context) {
    if(widget.hidden){
      return SizedBox.shrink();
    }
    else {
      return Container(
        height: 100,

        child : Card(
          elevation: 2,
          child: ListTile(
              onTap: () {
                print(widget.ressource.label);
                Navigator.pushNamed(context, '/ressource', arguments : widget.ressource );
              },
              title: Text(widget.ressource.label),
              subtitle: Text(
                  widget.ressource.description!,
                overflow: TextOverflow.fade,
                maxLines: 3,

              ),
              )
          )
      );
    }
  }
}
