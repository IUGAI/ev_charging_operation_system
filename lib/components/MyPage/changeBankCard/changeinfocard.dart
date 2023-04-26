import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/InfoWidget.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/components/SignUp/Text_Field_Widget.dart';
import 'package:ev_charging_operation_system/components/SignUp/Widget_of_Name.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_fields_pwd.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_fields_pwd_check.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_field_chose.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_field_car_number.dart';
import 'infocardpassword.dart';
import 'infoexpiredate.dart';
import '../change_charge/Info_Widget_Input_CardNumber.dart';

class ChangeInfoBankContainer extends StatelessWidget {
  const ChangeInfoBankContainer({
    required this.id,
    required this.name,
    required this.phone,
    required this.carNumber,
    required this.birth,
    required this.gender,
    Key? key,
  }) : super(key: key);
  final String id;
  final String name;
  final String phone;
  final String carNumber;
  final String birth;
  final String gender;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration:
      BoxDecoration(border: Border.all(width: 1, color: Color(0xff323b4f))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Info_Widget_Input_Card_Number(
              borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              title: '카드번호',
              value: '교통카드'),
          Info_Widget_Input_Card_Expire(
              borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              title: '유효기간',
              value: '교통카드'),
          Info_Widget_Input_Card_Password(
              borderSide: BorderSide.none,
              title: '카드 비밀번호 앞 2자리',
              value: '교통카드'),
        ],
      ),
    );
  }
}
