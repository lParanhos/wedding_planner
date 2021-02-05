import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';

class Guest {
  String id;
  String name;
  GroomsmensSide side;
  bool isKid;
  int kidsAge;

  Guest({
    @required this.id,
    @required this.name,
    @required this.isKid,
    @required this.kidsAge,
    @required this.side,
  });
}
