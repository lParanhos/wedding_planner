import 'package:flutter/material.dart';
import 'package:weeding_planner/utils/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.logo,
          height: 250.0,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Meu Casamento',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
