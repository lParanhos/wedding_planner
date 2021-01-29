import 'package:flutter/material.dart';
import 'package:weeding_planner/features/welcome/welcome.dart';

class Routes {
  static const welcome = '/welcome';
}

extension RoutesMap on Routes {
  static Map<String, WidgetBuilder> get routes => {
        Routes.welcome: (context) => Welcome(),
      };
}
