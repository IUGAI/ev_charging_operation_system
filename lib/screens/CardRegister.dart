import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/model/UseProvider.dart';
import 'package:ev_charging_operation_system/components/CardRegisterBlock.dart';
import 'package:ev_charging_operation_system/model/UserInfo.dart';

class CardRegister extends StatefulWidget {
  const CardRegister({Key? key}) : super(key: key);

  @override
  State<CardRegister> createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3a475c),
          title: Text("NBplug", style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
        ),
        body:  WillPopScope(
          onWillPop: () async {
            if (Navigator.of(context).userGestureInProgress)
              return false;
            else
              return true;
          },
          child: Container(
              color: Color(0xff26303f),
              child: Center(
                child: CardRegisterBlock(),
              ),
            ),
        ),
        );
  }
}
