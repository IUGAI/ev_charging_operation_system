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

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    required this.emailcontroller,
    required this.passwordcontroller,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    String accesstoken = "";
    String refreshtokken = "";
    String userinfo = "";
    final provider = Provider.of<DataMulti>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          '로그인하기',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: screenWidth > 900 || screenWidth > 600 ? 27 : 16),
        ),
        onPressed: () async {
          String error = '';
          try {
            Dio dio = Dio();
            String url = "http://139.150.72.173:3000/user/login";

            // Define the JSON request body
            Map<String, dynamic> requestBody = {
              'id': emailcontroller.text,
              'password': passwordcontroller.text,
              "companyIdx": 1,
              "enterType": 2
            };

            // Encode the JSON request body
            String requestBodyJson = json.encode(requestBody);

            // Make the POST request with Dio
            Response response = await dio.post(
              url,
              data: requestBodyJson,
              options: Options(
                headers: {'Content-Type': 'application/json'},
              ),
            );

            // Print the response data
            accesstoken = response.data['data']['accessToken'];
            refreshtokken = response.data['data']['refreshToken'];
            userinfo = response.data['data']['userInfo']['id'];
            provider.settokken(accesstoken);
            provider.setCurrentUSer(userinfo);
            provider.refreshtokken_f(refreshtokken);
            print(response.data);
            // Navigate to the Agreement screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoadingScreen();
                },
              ),
            );
          } catch (e) {
            // Handle any errors that may occur
            if (e is DioError) {
              // Print the error message and response data
              print('Error: ${e.message}');
              error = e.response?.data['msg'];
            } else {
              // Print the generic error message
              print('Error: $e');
            }
            print(error);
            if (error == '허용된 사업자 페이지에서만 로그인이 가능합니다.' ){
              String error = '';
              try {
                Dio dio = Dio();
                String url = "http://139.150.72.173:3000/user/login";

                // Define the JSON request body
                Map<String, dynamic> requestBody = {
                  'id': emailcontroller.text,
                  'password': passwordcontroller.text,
                  "companyIdx": 2,
                  "enterType": 2
                };

                // Encode the JSON request body
                String requestBodyJson = json.encode(requestBody);

                // Make the POST request with Dio
                Response response = await dio.post(
                  url,
                  data: requestBodyJson,
                  options: Options(
                    headers: {'Content-Type': 'application/json'},
                  ),
                );

                // Print the response data
                accesstoken = response.data['data']['accessToken'];
                refreshtokken = response.data['data']['refreshToken'];
                userinfo = response.data['data']['userInfo']['id'];
                provider.settokken(accesstoken);
                provider.setCurrentUSer(userinfo);
                provider.refreshtokken_f(refreshtokken);
                print(response.data);
                // Navigate to the Agreement screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoadingScreen();
                    },
                  ),
                );
              } catch (e) {
                // Handle any errors that may occur
                if (e is DioError) {
                  // Print the error message and response data
                  print('Error: ${e.message}');
                  error = e.response?.data['msg'];
                } else {
                  // Print the generic error message
                  print('Error: $e');
                }
                print(error);
                if (error == '허용된 사업자 페이지에서만 로그인이 가능합니다.' ){

                } else {
                  return showMyDialog(context,error);
                }
              }
            } else {
              return showMyDialog(context,error);
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
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
      return AlertShow(message: msg);
    },
  );
}


