import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../model/UseMultiProvider.dart';
import '../networking/networking.dart';
import '../screens/webpage_findphone.dart';
import 'AlertWidget.dart';


var data;
String error = '';
String name = '';
String phone = '';
String email = '';
class FindPasswordBlock extends StatefulWidget {
  const FindPasswordBlock({Key? key}) : super(key: key);

  @override
  State<FindPasswordBlock> createState() => _FindPasswordBlockState();
}

class _FindPasswordBlockState extends State<FindPasswordBlock> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final provider =  Provider.of<DataMulti>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
          ),
          Text(
            "비밀번호 찾기",
            style: TextStyle(
                color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 45 : 30, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '이메일',
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              onChanged: (value){
               email = value;
              },
              decoration: InputDecoration(
                hintText: '이메일 입력해주세요',
                hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
                labelStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
            ),
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
                name = value;

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
                phone = value;
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
                hintText: '휴대폰 입력해주세요',
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
                '비밀번호 재설정',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: screenWidth > 900 || screenWidth > 600 ? 25 : 16),
              ),
              onPressed: () async {
                print(provider.findname);
                print(provider.findphone);
                try {
                  final dio = Dio();
                  final response = await dio.get('http://139.150.72.173:3000/user/find-pw?email=${email}&name=${name}&phone=${phone}');
                  if (response.statusCode == 200){
                    print(response.data['msg']);
                    showMyDialogs(context,response.data['msg']);
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

void showMyDialogs(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShowSuccessSendEmail(message: msg);
    },
  );
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShowFailSendEmail(message: msg);
    },
  );
}
