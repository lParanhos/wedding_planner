import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weeding_planner/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(WeedingPlanner());
}

class WeedingPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primaryColor: Color(0xFF27187e),
        backgroundColor: Colors.lightBlue[800],
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFf1f2f6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Opensans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        buttonColor: Colors.blue,
      ),
      initialRoute: Routes.onboarding,
      routes: RoutesMap.routes,
    );
  }
}
