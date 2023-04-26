import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class Govermnetcard extends StatelessWidget {
  const Govermnetcard({Key? key,required this.passwordController, required  this.hintextl, required this.isPassword, required this.function, required this.maxinput}) : super(key: key);
  final TextEditingController passwordController;
  final hintextl;
  final bool isPassword;
  final Function function;
  final int maxinput;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
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
        maxLength: maxinput,
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
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white, fontSize:15),
        decoration: InputDecoration(
          hintText: hintextl,
          hintStyle: TextStyle(color: Colors.white, fontSize:15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
