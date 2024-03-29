import 'package:flutter/material.dart';
import 'package:weeding_planner/features/groomsmen_weeding/groomsmen.dart';
import 'package:weeding_planner/features/guests/guests.dart';
import 'package:weeding_planner/features/home/home.dart';
import 'package:weeding_planner/features/login/login.dart';
import 'package:weeding_planner/features/onboarding/onboarding.dart';
import 'package:weeding_planner/features/splash_screen/splash_screen.dart';
import 'package:weeding_planner/features/suppliers/suppliers.dart';
import 'package:weeding_planner/features/welcome/welcome.dart';
import 'package:weeding_planner/models/wedding.dart';

class Routes {
  static const login = '/login';
  static const welcome = '/welcome';
  static const home = '/home';
  static const groomsmen = '/groomsmen';
  static const guests = '/guests';
  static const suppliers = '/suppliers';
  static const onboarding = '/onboarding';
  static const splashScreen = '/splashScreen';
}

extension RoutesMap on Routes {
  static Map<String, WidgetBuilder> get routes => {
        Routes.login: (context) => Login(),
        Routes.welcome: (context) => Welcome(),
        Routes.home: (context) {
          final wedding = ModalRoute.of(context).settings.arguments as Wedding;
          return Home(wedding);
        },
        Routes.groomsmen: (context) => Groomsmen(),
        Routes.guests: (context) => Guests(),
        Routes.suppliers: (context) => Suppliers(),
        Routes.onboarding: (context) => Onboarding(),
        Routes.splashScreen: (context) => SplashScreen(),
      };
}
