import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';
import 'package:weeding_planner/models/groomsmens.dart';

class GroomsmensList extends StatelessWidget {
  final List<Groomsmens> groomsmensList;
  final bool showSide;

  GroomsmensList({
    this.groomsmensList,
    this.showSide = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(15.0),
      itemCount: groomsmensList.length,
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            title: Text(groomsmensList[index].names),
            subtitle:
                showSide ? Text(toSideText(groomsmensList[index].side)) : null,
          ),
        );
      },
    );
  }
}
