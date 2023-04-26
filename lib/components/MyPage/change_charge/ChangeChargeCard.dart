import 'package:ev_charging_operation_system/components/MyPage/change_charge/InfoWidgetCharging.dart';
import 'package:ev_charging_operation_system/components/MyPage/change_charge/Info_Widget_Input_CardNumber.dart';
import 'package:flutter/material.dart';
import '../changeBankCard/infobankcard.dart';
import 'InfoWidgetChargingSingle.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/InfoWidget.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/components/SignUp/Text_Field_Widget.dart';
import 'package:ev_charging_operation_system/components/SignUp/Widget_of_Name.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_fields_pwd.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_fields_pwd_check.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_field_chose.dart';
import 'package:ev_charging_operation_system/components/MyPage/TextFields/Text_field_car_number.dart';

class ChangehChrgeContainers extends StatelessWidget {
  const ChangehChrgeContainers({
    required this.CardCompanyName,
    required this.CardCompanyNumber,

    Key? key,
  }) : super(key: key);
  final String CardCompanyName;
  final String CardCompanyNumber;



  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xff323b4f))),
        child: Info_Widget_Charging_Single(title: '카드 유형', value: CardCompanyName),
      ),
      SizedBox(height: 20),
      Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xff323b4f))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Info_Widget_Charging(
                  borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
                  title: '카드 발급 기관',
                  value: '교통카드'),
              Info_Widget_Input_Bank_Card_Number(
                  borderSide: BorderSide.none,
                  title: '카드번호',
                  value: '교통카드'),
            ],
          ))
    ]);
  }
}
