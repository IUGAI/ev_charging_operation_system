import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class Info_widget_Car extends StatelessWidget {
  const Info_widget_Car({ required this.borderSide, required this.title, required this.value,
    Key? key, required this.carvalue,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;
  final String carvalue;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: borderSide
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,),
          SizedBox(height: 5),
          Text('$carvalue $value', style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15),),
        ],
      ),
    );
  }
}
