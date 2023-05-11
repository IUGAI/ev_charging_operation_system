import 'package:flutter/material.dart';
class Title_field extends StatelessWidget {
  const Title_field({
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
            "충전시 사용하실 충전카트를 선택해주세요",
            style: TextStyle(
                color: Color(0xffd0d9e4),
                fontSize:  screenWidth > 900 || screenWidth > 600 ? 23  : 15,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}