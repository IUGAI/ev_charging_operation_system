import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class Title_field_Sc extends StatelessWidget {
  const Title_field_Sc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text("충전기에 사업자에서 발급한 카드나 교통카드 태그후 \n충전할 수 있습니다 ",
              style: screenWidth > 900 || screenWidth > 600 ? loginText_l :   loginText),
        ),
      ),
    );
  }
}