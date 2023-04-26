import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/screens/FIndphone.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class FindIdBtn extends StatelessWidget {
  const FindIdBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: Align(
        child: TextButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Findphone();
                },
              ),
            );
          },
          child: Text(
            "아이디 찾기",
            style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}