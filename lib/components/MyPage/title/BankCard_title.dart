import 'package:ev_charging_operation_system/components/MyPage/title/MyPageTitle.dart';
import 'package:flutter/material.dart';

class BankCard_title extends StatelessWidget {
  const BankCard_title({
    Key? key, required this.card_title
  }) : super(key: key);

  final String card_title;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      My_page_title(title: card_title),
      Container(
          width: 100,
          height: 25,
          margin: EdgeInsets.only(right: 35),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              card_title,
              style: TextStyle(fontSize: 12),
            ),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff73839e),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ))
    ]);
  }
}