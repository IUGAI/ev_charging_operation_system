import 'package:ev_charging_operation_system/components/MypageBlock.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/InfoWidget.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/components/SignUp/Text_Field_Widget.dart';
import 'package:ev_charging_operation_system/components/SignUp/Widget_of_Name.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_fields_pwd.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_fields_pwd_check.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_field_chose.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_field_car_number.dart';

var textEditingController = TextEditingController();

class ChangeInfoContainer extends StatefulWidget {
  const ChangeInfoContainer({
    required this.id,
    required this.name,
    required this.phone,
    required this.carNumber,
    required this.birth,
    required this.gender,
    Key? key, required this.carIdx,
  }) : super(key: key);
  final String id;
  final String name;
  final String phone;
  final String carNumber;
  final String birth;
  final String gender;
  final String carIdx;

  @override
  State<ChangeInfoContainer> createState() => _ChangeInfoContainerState();
}

class _ChangeInfoContainerState extends State<ChangeInfoContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Color(0xff323b4f))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Info_widget(
              borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              title: '이메일',
              value: widget.id),
          Info_widget(
            borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
            title: '회원명',
            value: widget.name,
          ),
          Info_widget(
            borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
            title: '생년월일 / 성별',
            value: '${widget.birth} / ${widget.gender}',
          ),
          Info_widget(
              borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              title: '전화번호',
              value: widget.phone),
          ChangePassword(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 1, color: Color(0xff323b4f)),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '차종',
                  style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
                ),
                SizedBox(height: screenWidth > 900 ||  screenWidth > 600  ? 20 : 10),
                Text_Field_Check(
                  currentCarIdx: widget.carIdx,
                  title: '차종 선택',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xff323b4f)),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '차량 번호',
                  style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
                ),
                SizedBox(height:screenWidth > 900 ? 20 :  10),
                Text_field_car_number(carnumbervalue : widget.carNumber, hintextl: '',isPassword : false),
                SizedBox(height:screenWidth > 900 ? 20 :  10),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Color(0xff323b4f)),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '새 비밀번호',
            style: screenWidth > 900  ||  screenWidth > 600 ?  loginText_l : loginText,
          ),
          SizedBox(height: screenWidth > 900 ? 20 : 10),
          TextFieldPwd(
            hintextl: '비밀번호 입력해 주세요',
            isPassword: true,
          ),
          SizedBox(height: screenWidth > 900 ? 30 : 10),
          TextFieldPwd_check(
            hintextl: '비밀번호 다시 한번 입력해 주세요',
            isPassword: true,
          ),

        ],
      ),
    );
  }
}
