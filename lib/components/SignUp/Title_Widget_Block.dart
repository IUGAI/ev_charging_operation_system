import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key, required this.title, required this.style
  }) : super(key: key);
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: style,
            textAlign: TextAlign.left,
          )),
    );
  }
}