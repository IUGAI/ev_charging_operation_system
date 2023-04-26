import 'package:ev_charging_operation_system/screens/AppGuide.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'Login/Login_btn_Block/FindPswBtn.dart';
import 'Login/Login_btn_block//LoginBtn.dart';
import 'Login/Login_btn_block//SignInBtn.dart';
import 'Login/Login_btn_block/FindidBtn.dart';
import 'Login/Login_text_Field/Login_Text_Field.dart';
import 'Login/Login_title_Block/Title_block.dart';
import 'Login/Login_text_Field/Passport_text_field.dart';
import 'SignUp/Text_Field_Widget.dart';

class LoginBlock extends StatefulWidget {
  const LoginBlock({Key? key}) : super(key: key);

  @override
  State<LoginBlock> createState() => _LoginBlockState();
}

class _LoginBlockState extends State<LoginBlock> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding: screenWidth > 900  ?  EdgeInsets.symmetric(horizontal: 150, vertical: 50) : EdgeInsets.all(0),
      child: ListView(
        children: [
          SizedBox(height:screenWidth > 900  || screenWidth > 600 ? 60 :  30),
          LoginTitle(),
          SizedBox(height: screenWidth > 900 || screenWidth > 600 ? 120 : 60),
          TitleBlock(
            title: '이메일(아이디)',
          ),
          SizedBox(height: screenWidth > 900 || screenWidth > 600 ?  20 : 10),
          TextFiedLogin(controller: _idController),
          SizedBox(height: screenWidth > 900 || screenWidth > 600 ? 20 : 10),
          TitleBlock(
            title: '비밀번호',
          ),
          SizedBox(height:screenWidth > 900 || screenWidth > 600 ? 20 : 10),
          PassportFieldWidget(
            passwordController: _passwordController,
            hintextl: '',
            isPassword: true,
          ),
          SizedBox(height: screenWidth > 900  || screenWidth > 600 ?  40 : 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
          [
            FindIdBtn(),
            FindPswBtn()]),
          SizedBox(
            height: screenWidth > 900 || screenWidth > 600 ?  40 : 20,
          ),
          LoginBtn(
              emailcontroller: _idController,
              passwordcontroller: _passwordController),
          SizedBox(
            height: screenWidth > 900 || screenWidth > 600 ? 40 : 20,
          ),
          SignInBtn(),
          SizedBox(
            height: screenWidth > 900 ? 40 : 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        primary: Color(0xff73829E),
                        onPrimary: Colors.white, // set the text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // set the border radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AppGuide(guide: '1');
                            },
                          ),
                        );
                      },
                      child: Text('회원 가입 절차', style: TextStyle(fontSize:screenWidth > 900  || screenWidth > 600 ? 27 : 15)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        primary: Color(0xff73829E),
                        onPrimary: Colors.white, // set the text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // set the border radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AppGuide(guide: '0');
                            },
                          ),
                        );
                      },
                      child: Text('충전카드 등록시 유의점',style: TextStyle(fontSize:screenWidth > 900 || screenWidth > 600 ?  27 : 15)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
