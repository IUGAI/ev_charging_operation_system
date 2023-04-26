import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class TitleBlock extends StatelessWidget {
  const TitleBlock({
    Key? key, required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: screenWidth > 700 ? loginText_lg : screenWidth > 600 ? loginText_l : loginText,
            textAlign: TextAlign.left,
          )),
    );
  }
}



class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Center(
      child: Text(
        "로그인", style: TextStyle(color: Colors.white, fontSize: screenWidth > 700 ? 70 : screenWidth > 600 ? 50 : 30, fontWeight: FontWeight.w900),
      ),
    );
  }
}

