import 'package:flutter/material.dart';

import '../../../screens/ChangeData.dart';
import 'MyPageTitle.dart';


class Myinfo_title extends StatelessWidget {
  const Myinfo_title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      My_page_title(title: '기본정보'),
      Container(
          width: 100,
          height: 25,
          margin: EdgeInsets.only(right: 35),
          child: ElevatedButton(
            onPressed: () {

            },
            child: Text(
              '내 정보 수정',
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
