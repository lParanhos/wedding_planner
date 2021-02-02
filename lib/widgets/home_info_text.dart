import 'package:flutter/material.dart';

class HomeInfoText extends StatelessWidget {
  final String text;

  HomeInfoText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
          child: Text(text),
        ),
        Divider(),
      ],
    );
  }
}
