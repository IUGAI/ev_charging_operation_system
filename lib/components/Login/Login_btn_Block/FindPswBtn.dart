import 'package:ev_charging_operation_system/components/FindPasswordBlock.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/screens/FIndphone.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

import '../../../screens/FindPassword.dart';

class FindPswBtn extends StatelessWidget {
  const FindPswBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: Align(
        child: TextButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FindPassword();
                },
              ),
            );
          },
          child: Text(
            "비밀번호찾기",
            style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}