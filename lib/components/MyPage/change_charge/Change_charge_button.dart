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

class ChangeButtonCharge extends StatelessWidget {
  const ChangeButtonCharge({

    Key? key,
  }) : super(key: key);





  @override
  Widget build(BuildContext context) {
    String accesstoken = "";
    String userinfo = "";
    String error = '';
    final provider = Provider.of<DataMulti>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          '충전카드 수정하기',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        onPressed: ()  async {
          String newcardnumber = provider.newvalueofchargecardnumner;
          String newcardtype = provider.newchargecardtype;
          final dio = Dio();
          final token =  provider.accestokken;

          final headers = {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          };

          final data = {
            'cardCompanyIdx': newcardtype,
            'cardNumber':  newcardnumber,
            'cardPassword' : "1111"
          };

          final jsonBody = jsonEncode(data);

          try {
            final response = await dio.patch(
              'http://139.150.72.173:3000/user/charge-card',
              data: jsonBody,
              options: Options(headers: headers),
            );

            if (response.statusCode == 200) {
              // Success handling code here
              print(response.data);
              showMyDialog(context,'수정 됐습니다');
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



