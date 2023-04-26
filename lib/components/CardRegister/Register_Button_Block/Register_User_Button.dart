import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:ev_charging_operation_system/components/AlertWidget.dart';


class Register_User_Btn extends StatelessWidget {
  const Register_User_Btn({
    required this.number, required this.id_p,
    Key? key, required this.function,
  }) : super(key: key);

   final String number;
   final String id_p;
   final Function function;
  @override
  Widget build(BuildContext context) {
    final stringProvider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              '다음 ',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: screenWidth > 900 || screenWidth > 600  ? 24 :  16),
            ),
            onPressed: () {
             function();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              primary: Color(0xff73829E),
              onPrimary: Colors.white, // set the text color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // set the border radius
              ),
            ),
          ),
        );
      }
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShowSignSuccess(message: msg);
    },
  );
}


void showMyDialogs(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg,);
    },
  );
}
