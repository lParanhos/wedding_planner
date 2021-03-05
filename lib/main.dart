import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/services/firebase.dart';
import 'package:weeding_planner/services/sharedPrefs.dart';

void setupSingletons() async {
  if (!GetIt.instance.isRegistered<FirebaseService>()) {
    GetIt.instance
        .registerLazySingleton<FirebaseService>(() => FirebaseService());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  setupSingletons();

  runApp(WeedingPlanner());
}

// ignore: must_be_immutable
class WeedingPlanner extends StatelessWidget {
  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

  bool _isAuth;

  WeedingPlanner() {
    _isAuth = _firebaseService.firebaseAuth.currentUser != null;
  }

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
      initialRoute: _isAuth ? Routes.splashScreen : Routes.onboarding,
      routes: RoutesMap.routes,
    );
  }
}
