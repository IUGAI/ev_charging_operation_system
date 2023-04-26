import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/components/FindphoneBlock.dart';
import 'package:ev_charging_operation_system/screens/FIndphone.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/screens/Agreement.dart';
import 'package:provider/provider.dart';

import '../model/UseMultiProvider.dart';
import '../networking/networking.dart';
import '../screens/webpage_findphone.dart';
import 'AlertWidget.dart';

var data;
String error = '';
class FindPhoneBlock extends StatefulWidget {
  const FindPhoneBlock({Key? key}) : super(key: key);

  @override
  State<FindPhoneBlock> createState() => _LoginBlockState();
}

class _LoginBlockState extends State<FindPhoneBlock> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider =  Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
          ),
          Text(
            "아이디 찾기",
            style: TextStyle(
                color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 45 : 30, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '성명',
                  style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
                  textAlign: TextAlign.left,
                )),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff2d3748),
              border: Border.all(
                width: 0,
                color: Color(0xff2d3748),
              ),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _idController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              onChanged: (value){
                provider.setfindname(value);
              },
              decoration: InputDecoration(
                hintText: '이름을 입력해주세요',
                hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
                labelStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              child: Text(
                "휴대폰번호 ",
                style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff2d3748),
              border: Border.all(
                width: 0,
                color: Color(0xff2d3748),
              ),
            ),
            child: TextFormField(
              cursorColor: Colors.white,
              controller: _passwordController,
              maxLength: 13,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,

              onChanged: (value){
                if (value.length == 4 && value[3] != '-') {
                  // Add a hyphen after the fourth character
                  _passwordController.text = value.substring(0, 3) + '-' + value.substring(3);
                  _passwordController.selection =
                      TextSelection.collapsed(offset: _passwordController.text.length);
                } else if (value.length == 9 && value[8] != '-') {
                  // Add a hyphen after the eighth character
                  _passwordController.text = value.substring(0, 8) + '-' + value.substring(8);
                  _passwordController.selection =
                      TextSelection.collapsed(offset: _passwordController.text.length);
                }
                provider.setfindphone(value);
              },
              buildCounter: (BuildContext context,
                  {int? currentLength, int? maxLength, bool? isFocused}) {
                if (currentLength == maxLength) {
                  return null;
                }
                return Container(
                  height: 0,
                  width: 0,
                );
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
                hintText: '휴대폰번호 입력해주새요',
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                '아이디 찾기',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: screenWidth > 900 || screenWidth > 600 ? 25 : 16),
              ),
              onPressed: () async {
                print(provider.findname);
                print(provider.findphone);
                try {
                  final dio = Dio();
                  final response = await dio.get('http://139.150.72.173:3000/user/is-user?name=${provider.findname}&phone=${provider.findphone}');
                  if (response.statusCode == 200){
                    print(response.data['msg']);
                    print(response.data['data']['isUser']);
                    if (response.data['data']['isUser'] == 'Y'){
                         print('success');
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) {
                               return WebpageFindPhone();
                             },
                           ),
                         );
                    } else {
                      showMyDialog(context,'가입된 정보가 없습니다');
                    }
                  }
                }  catch (e) {
                  // Handle any errors that may occur
                  if (e is DioError) {
                    // Print the error message and response data
                    print('Error: ${e.message}');
                    error = e.response?.data['msg'];
                  } else {
                    // Print the generic error message
                    print('Error: $e');
                  }
                  return showMyDialog(context,error);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                primary: Color(0xff02aff0),
                onPrimary: Colors.white, // set the text color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // set the border radius
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}




Future<dynamic> getinpaidata(String name, String phone) async {
  NetworkHelper networkhelper = NetworkHelper();
  var weatherData = await networkhelper.getfindphone( name,  phone);
  return weatherData;
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg);
    },
  );
}