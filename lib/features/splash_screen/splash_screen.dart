import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weeding_planner/utils/assets.dart';

class SplashScreen extends StatelessWidget {
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
