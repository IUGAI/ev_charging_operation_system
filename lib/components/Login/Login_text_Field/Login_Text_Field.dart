import 'package:flutter/material.dart';

class TextFiedLogin extends StatelessWidget {
  const TextFiedLogin({
    Key? key,
    required this.controller ,
  }) :  super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      height: screenWidth > 900 || screenWidth > 600 ? 60 : 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff2d3748),
        border: Border.all(
          width: 0,
          color: Color(0xff2d3748),
        ),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600  ? 22 : 15 ),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding:
          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
      ),
    );
  }
}



