import 'package:ev_charging_operation_system/components/MyPage/title/InfoWidgetCar.dart';
import 'package:flutter/material.dart';
import 'InfoWidget.dart';

class My_info_container extends StatelessWidget {
  const My_info_container({
    required this.id, required this.name, required this.phone, required this.carNumber,
    Key? key, required this.carName,
  }) : super(key: key);
  final String id;
  final String name;
  final String phone;
  final String carNumber;
  final String carName;

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
              value: id),
          Info_widget(
            borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
            title: '회원명',
            value: name,
          ),
          Info_widget(
              borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              title: '전화번호',
              value: phone),
          Info_widget_Car(borderSide: BorderSide.none, title: '차량번호', value: carNumber,carvalue: carName,),
        ],
      ),
    );
  }
}