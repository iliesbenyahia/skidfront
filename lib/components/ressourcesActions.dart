import 'package:flutter/material.dart';


class ressourceActions extends StatefulWidget {
  const ressourceActions({Key? key}) : super(key: key);

  @override
  State<ressourceActions> createState() => _ressourceActionsState();
}

class _ressourceActionsState extends State<ressourceActions> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Card(child: Row(
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
    ),),);
  }
}
