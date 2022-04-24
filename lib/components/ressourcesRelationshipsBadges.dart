import 'package:flutter/material.dart';
import '../data/models/ressource.dart';

import '../data/models/relationship.dart';

class relationshipBadges extends StatefulWidget {
  final List<Relationship> relationships;
  const relationshipBadges({Key? key, required this.relationships}) : super(key: key);

  @override
  State<relationshipBadges> createState() => _relationshipBadgesState();
}

class _relationshipBadgesState extends State<relationshipBadges> {
  @override
  Widget build(BuildContext context) {
    List<Widget> badges = [];
    for(Relationship rel in widget.relationships){
        badges.add(
            Chip(
              padding: EdgeInsets.all(0),
              backgroundColor: Color(0xff544cb4),
              label: Text(rel.label, style: TextStyle(color: Colors.white)),
          ));
    }
    return Row(children: badges,);
  }
}
