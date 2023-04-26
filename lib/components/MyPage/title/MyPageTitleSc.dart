import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:flutter/material.dart';

class My_page_title_Sc extends StatelessWidget {
  const My_page_title_Sc({required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
            children: [ Container(
              child: Text(
                title,  style: screenWidth > 900 || screenWidth > 600 ? loginText : loginText_s,
              ),
            ),
            ]
        ),
      ),
    );
  }
}