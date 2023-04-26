import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class TextFieldCardPasswordBlock extends StatelessWidget {
  const TextFieldCardPasswordBlock({Key? key, required this.passwordController, required  this.hintextl, required this.isPassword, required this.function}) : super(key: key);
  final TextEditingController passwordController;
  final hintextl;
  final bool isPassword;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      height: screenWidth > 900 || screenWidth > 600 ? 60 :  50,
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
        onChanged: (value){
          function(value);
        },
        maxLength: 2,
        buildCounter: (BuildContext context, { int? currentLength, int? maxLength, bool? isFocused }) {
          if (currentLength == maxLength) {
            return null;
          }
          return Container(
            height: 0,
            width: 0,
          );
        },
        obscureText: isPassword,
        cursorColor: Colors.white,
        controller: passwordController,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15),
        decoration: InputDecoration(
          hintStyle: screenWidth > 900 || screenHeight > 600 ? loginText_l : loginText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
