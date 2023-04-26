import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'SignUp/Next_Button_Block.dart';
import 'SignUp/Sign_up_title.dart';
import 'SignUp/Text_Field_Auto.dart';
import 'SignUp/Widget_Choose.dart';
import 'SignUp/Widget_of_Name.dart';
import 'SignUp/Passport_Data.dart';
import 'SignUp/Title_Widget_Block.dart';
import 'package:provider/provider.dart';
import 'SignUp/Text_Field_Widget.dart';
import 'package:ev_charging_operation_system/model/UseProvider.dart';
import 'SignUp/Text_Field_Widger_PwCheck.dart';
import 'SignUp/Text_Field_Normal.dart';
import 'SignUp/Text_Field_Name.dart';
import 'SignUp/TextFieldNumberCar.dart';

class SignUpBlock extends StatefulWidget {
  const SignUpBlock({Key? key}) : super(key: key);

  @override
  State<SignUpBlock> createState() => _SignUpBlockState();
}

class _SignUpBlockState extends State<SignUpBlock> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllercheck =
      TextEditingController();
  final _nameController = TextEditingController();
  final _phoneContoller = TextEditingController();
  final _passportController_date = TextEditingController();
  final _passportController_gender = TextEditingController();
  final _car_numberController = TextEditingController();
  String? _selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _nameController.text = '홍길동';
    // _phoneContoller.text = '010-1111-2222';
    // _passportController_date.text = "981213";
    // _passportController_gender.text = "5******";
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
        child: ListView(
          children: [
            SizedBox(height: screenWidth > 900  || screenWidth > 600 ? 50.0 : 30.0),
            SIgn_up_title(),
            SizedBox(height: 30.0),
            TitleWidget(title: '이메일', style:   screenWidth > 900  || screenWidth > 600  ?  loginText_l : loginText),
            SizedBox(height: 10),
            Textfield_Normal(
              passwordController: _idController,
              hintextl: '아이디 사용됩니다',
              isPassword: false,
            ),
            SizedBox(
              height: 20.0,
            ),
            TitleWidget(
              title: '비밀번호',
              style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
            ),
            SizedBox(height: 10),
            TextFieldWidget(
              passwordController: _passwordController,
              hintextl: '8~15자 영문,숫자, 특수문자 조합으로 입력해주세요 ',
              isPassword: true,
            ),
            SizedBox(height: 20),
            TitleWidget(title: '비밀번호확인', style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText),
            SizedBox(height: 10),
            TextFieldWidget_Pwcheck(
              passwordController: _passwordControllercheck,
              hintextl: '',
              isPassword: true,
            ),
            SizedBox(height: 40),
            TitleWidget(title: '성명', style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText),
            SizedBox(height: 10),
            TextFieldName(nameController: _nameController),
            SizedBox(height: 20),
            TitleWidget(title: '휴대전화번호', style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText),
            SizedBox(height: 10),
            TextFieldAuto(nameController: _phoneContoller),
            SizedBox(
              height: 20,
            ),
            TitleWidget(title: '주민등록번호', style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText),
            SizedBox(
              height: 10,
            ),
            Passportdata(
                passportController_date: _passportController_date,
                passportController_gender: _passportController_gender),
            SizedBox(height: 20),
            TitleWidget(title: '차종', style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText),
            SizedBox(height: 10),
            Wudget_choose(
              title: '차종 선택',
            ),
            SizedBox(height: 20),
            TitleWidget(title: '차량번호', style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText),
            SizedBox(height: 10),
            Textfield_NumberCar(
              hintextl: '',
              isPassword: false,
            ),
            SizedBox(height: 30),
            Next_Button(),
            SizedBox(height: 30),
          ],
        ),
      );
  }
}

