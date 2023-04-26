import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

import '../../MyAppGuideBlock.dart';

class Info_register_card extends StatefulWidget {
  const Info_register_card({ required this.borderSide, required this.title, required this.value,
    Key? key, required this.function,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;
  final Function function;

  @override
  State<Info_register_card> createState() => _Info_register_cardState();
}

class _Info_register_cardState extends State<Info_register_card> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 25 , horizontal: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: widget.borderSide
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Image.asset('img/card_img.jpeg', scale: screenWidth > 900 || screenWidth > 600 ? 1 :  2,),
          SizedBox(height: 10),
          Text('결제카드를 등록해주세요', style: loginText,),
          SizedBox(height: 20,),
          Container(
              width: screenWidth > 900 || screenWidth > 600 ? 200 : 120,
              height: screenWidth > 900 || screenWidth > 600 ? 40 : 25,
              child: ElevatedButton(
                onPressed: () {
                  widget.function();
                },
                child: Text(
                 '결제카드 등록',
                  style: TextStyle(fontSize: screenWidth > 900  || screenWidth > 600 ? 24 : 12),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff73839e),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth > 900 || screenWidth > 600 ? 20 : 10))),
              ))
        ],
      ),
    );
  }
}
