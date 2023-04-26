import 'package:ev_charging_operation_system/screens/LoadingScreen.dart';
import 'package:ev_charging_operation_system/screens/MyPage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/screens/Login.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:ev_charging_operation_system/screens/Agreement.dart';
import 'package:ev_charging_operation_system/components/AlertWidget.dart';

import '../../../networking/networking.dart';

class ChangeButtonCard extends StatelessWidget {
  const ChangeButtonCard({
    Key? key, required this.titletext, required this.function,
  }) : super(key: key);

  final String titletext;
  final Function function;



  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
      titletext,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize:screenWidth  > 700 || screenWidth > 600 ? 22 :  16),
        ),
        onPressed: ()  async {
           function();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          primary: Color(0xff0aaff0),
          onPrimary: Colors.white, // set the text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // set the border radius
          ),
        ),
      ),
    );
  }
}




