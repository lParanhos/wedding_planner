import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';
import 'package:weeding_planner/models/guest.dart';

class GuestsList extends StatelessWidget {
  final bool showSide;
  final Function(String) onDelete;
  final List<Guest> guests;

  GuestsList({
    this.showSide = false,
    @required this.onDelete,
    @required this.guests,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Total: ${guests.length}'),
        ),
        ...guests.map((guest) {
          return Card(
            elevation: 2.0,
            child: ListTile(
              title: Text(guest.name),
              subtitle: showSide ? Text(toSideText(guest.side)) : null,
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => onDelete(guest.id),
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}
