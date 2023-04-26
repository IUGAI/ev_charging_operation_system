import 'package:flutter/material.dart';

class Navigation_container extends StatelessWidget {
  const Navigation_container({
    required this.backgr,
    required this.side,
    required this.text,
    required this.textColor,
    required this.function,
    Key? key,
  }) : super(key: key);

  final Color backgr;
  final Color side;
  final Color textColor;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        decoration: BoxDecoration(
          color: backgr,
          border: Border(
            top: BorderSide(color: side, width: 1.0),
            left: BorderSide(color: side, width: 1.0),
            right: BorderSide(color: side, width: 1.0),
            bottom: BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor,fontSize: screenWidth > 900 || screenWidth > 600 ? 26 : 13),
        ),
      ),
    );
  }
}