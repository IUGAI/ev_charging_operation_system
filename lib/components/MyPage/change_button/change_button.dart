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

class ChangeButton extends StatelessWidget {
  const ChangeButton({

    Key? key,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    String accesstoken = "";
    String userinfo = "";
    String error = '';
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final provider = Provider.of<DataMulti>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          '수정하기',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: screenWidth > 900 || screenWidth > 600 ? 25 :  16),
        ),
        onPressed: ()  async {
          String passwordController = provider.changepassword;
          String passwordControllerchecked = provider.changepasswordcheck;
          String carnumber = provider.changecarnumber;
          String carNAme = provider.changecarname;
          print(carNAme);
             if (passwordController != passwordControllerchecked){
               return showMyDialog(context, '비밀번호가 일치하지 않습니다');
             } else {
               final dio = Dio();
               final token =  provider.accestokken;

               final headers = {
                 'Authorization': 'Bearer $token',
                 'Content-Type': 'application/json',
               };

               final data = {
                 'pw': passwordController,
                 'carNumber':  carnumber,
                 'carIdx' : carNAme
               };

               final jsonBody = jsonEncode(data);

               try {
                 final response = await dio.patch(
                   'http://139.150.72.173:3000/user/basic',
                   data: jsonBody,
                   options: Options(headers: headers),
                 );

                 if (response.statusCode == 200) {
                   // Success handling code here
                   print(response.data);
                   showMyDialog(context, response.data['msg']);
                 } else {
                   // Error handling code here
                   print('Request failed with status: ${response.statusCode}');
                 }
               } catch (e) {
                 // Error handling code here
                 if (e is DioError) {
                   // Print the error message and response data
                   print('Error: ${e.message}');
                   error = e.response?.data['msg'];
                 } else {
                   // Print the generic error message
                   print('Error: $e');
                 }
                 return showMyDialogerror(context,error);
               }
             }
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

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertUpdateSuccess(message: msg);
    },
  );
}

void showMyDialogerror(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg);
    },
  );
}



