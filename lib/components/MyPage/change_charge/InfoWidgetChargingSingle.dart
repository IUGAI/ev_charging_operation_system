import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class Info_Widget_Charging_Single extends StatelessWidget {
  const Info_Widget_Charging_Single({  required this.title, required this.value,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style:  screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,),
          SizedBox(height: 5),
          Text(value, style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15 ),),
        ],
      ),
    );
  }
}
