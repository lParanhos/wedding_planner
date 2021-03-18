import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weeding_planner/models/wedding.dart';
import 'package:weeding_planner/utils/assets.dart';

class Countdown extends StatelessWidget {
  final Wedding wedding;

  Countdown(this.wedding);

  int get _countdown => wedding.weddingDay.difference(DateTime.now()).inDays;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      height: mediaQuery.size.height * 0.3,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Lottie.asset(
                Assets.heartsFly,
                fit: BoxFit.fill,
                height: mediaQuery.size.height * 0.3,
              ),
            ],
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${wedding.groomName} & ${wedding.brideName}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                Text(
                  '$_countdown',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Dias',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Até o nosso casamento',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  wedding.formatedDate,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
