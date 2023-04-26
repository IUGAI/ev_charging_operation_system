import 'package:flutter/material.dart';

import 'MyPageTitle.dart';

class ChargeCard_title extends StatefulWidget {
  const ChargeCard_title({
    Key? key,
  }) : super(key: key);

  @override
  State<ChargeCard_title> createState() => _ChargeCard_titleState();
}

class _ChargeCard_titleState extends State<ChargeCard_title> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      My_page_title(title: '충전카드'),
      Container(
          width: 100,
          height: 25,
          margin: EdgeInsets.only(right: 35),
          child: ElevatedButton(
            onPressed: () {
              setState(() {

              });
            },
            child: Text(
              '충전카드 변경',
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