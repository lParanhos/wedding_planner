import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final double width;
  final String text;
  final Function onPressed;

  CustomRaisedButton({
    @required this.onPressed,
    @required this.width,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
