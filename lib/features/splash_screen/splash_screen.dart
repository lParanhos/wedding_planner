import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/utils/assets.dart';
import 'package:weeding_planner/services/wedding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void findUserWeeding() async {
    try {
      final weeding = await WeddingService().getWedding();
      if (weeding?.id != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.home, (route) => false);
        return;
      }

      Navigator.of(context).pushNamed(Routes.welcome);
    } catch (e) {
      print('HIHIHIH');

      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    findUserWeeding();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Lottie.asset(
        Assets.valentinesDay,
        fit: BoxFit.contain,
      ),
    );
  }
}
