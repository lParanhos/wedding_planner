import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final Widget icon;
  final Function onPressed;
  final Color color;

  CircularIconButton({
    @required this.icon,
    @required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50.0,
      color: color,
      shape: CircleBorder(),
      child: icon,
    );
  }
}
