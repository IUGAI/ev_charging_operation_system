import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/screens/Agreement.dart';
import 'package:ev_charging_operation_system/screens/CardRegister.dart';
class SignInBtn extends StatelessWidget {
  const SignInBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: OutlinedButton(
        child: Text('회원가입하기', style: TextStyle(fontWeight: FontWeight.w900,fontSize: screenWidth > 900  || screenWidth > 600 ? 27 : 16),),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Agreement();
              },
            ),
          );
        },
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            side: BorderSide(
                width: 1,
                color: Color(0xff02aff0)
            )
        ),
      ),
    );
  }
}

