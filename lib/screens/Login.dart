import 'package:flutter/material.dart';
import  'package:ev_charging_operation_system/components/LoginBlock.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return WillPopScope(
      onWillPop: () { 
        return Future(() => false);
       },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
         appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor: Color(0xff3a475c),
           title: Text(appBarText, style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
         ),
         body: WillPopScope(
           onWillPop: () async {
             if (Navigator.of(context).userGestureInProgress)
               return false;
             else
               return true;
           },
           child: Container(
            padding: EdgeInsets.symmetric(horizontal:  20, vertical: 20),
             color: Color(0xff26303f),
              child:  Center(
                child: LoginBlock() ,
              ),
           ),
         ),
      ),
    );
  }
}
