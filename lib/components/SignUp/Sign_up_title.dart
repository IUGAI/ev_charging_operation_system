import 'package:flutter/material.dart';

class SIgn_up_title extends StatelessWidget {
  const SIgn_up_title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(
            "회원가입", style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ?  30 : 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}