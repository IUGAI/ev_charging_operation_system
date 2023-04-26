import 'package:flutter/material.dart';

class Agreement_Block extends StatelessWidget {
  const Agreement_Block({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff26303f),
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: screenWidth > 900 || screenWidth > 600 ? 60 : 50,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: Text(
            '약관동의',
            style: (TextStyle(
                fontSize: screenWidth > 900 || screenWidth > 600 ? 24 : 18,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
          )),
    );
  }
}