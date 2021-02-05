import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';

class Groomsmens {
  String id;
  String names;
  GroomsmensSide side;

  Groomsmens({
    @required this.id,
    @required this.names,
    @required this.side,
  });
}
