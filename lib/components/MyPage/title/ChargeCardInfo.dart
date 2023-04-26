import 'package:flutter/material.dart';
import 'InfoWidget.dart';

class ChargeCard_Container extends StatelessWidget {
  const ChargeCard_Container({
    Key? key, required this.chargeCardCompanyName, required this.chargeCardCompanyNumber, required this.chargeCardRegisterDate,
  }) : super(key: key);

  final String chargeCardCompanyName;
  final String  chargeCardCompanyNumber;
  final String chargeCardRegisterDate;

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
          Info_widget(
              borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              title: '카드발급기관',
              value: chargeCardCompanyName),
          Info_widget(
            borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
            title: '카드번호',
            value: chargeCardCompanyNumber,
          ),
          Info_widget(
              borderSide: BorderSide.none,
              title: '등록/변경일자',
              value: chargeCardRegisterDate),
        ],
      ),
    );
  }
}
