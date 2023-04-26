import 'package:flutter/material.dart';
import 'InfoWidget.dart';

class BankCard_Container extends StatelessWidget {
  const BankCard_Container({
    Key? key, required this.creditCardConpanyName, required this.creditCardNumber, required this.creditCardRegistDate,
  }) : super(key: key);

  final TextEditingController  creditCardConpanyName;
  final String  creditCardNumber;
  final String  creditCardRegistDate;

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
              title: '카드사',
              value: creditCardConpanyName.text),
          Info_widget(
            borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
            title: '카드번호',
            value: creditCardNumber,
          ),
          Info_widget(
              borderSide: BorderSide.none,
              title: '등록/변경일자',
              value: creditCardRegistDate),
        ],
      ),
    );
  }
}