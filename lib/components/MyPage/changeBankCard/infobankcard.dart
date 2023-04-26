import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

import '../../CardRegister/TextFied_Card.dart';
import '../../SignUp/Widget_of_Name.dart';
import '../change_charge/TextFieldWidgetCard.dart';

class Info_Widget_Input_Bank_Card_Number extends StatefulWidget {
  const Info_Widget_Input_Bank_Card_Number({ required this.borderSide, required this.title, required this.value,
    Key? key,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;

  @override
  State<Info_Widget_Input_Bank_Card_Number> createState() => _Info_Widget_Input_Card_NumberState();
}

class _Info_Widget_Input_Card_NumberState extends State<Info_Widget_Input_Bank_Card_Number> {
  final transportcard = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: widget.borderSide
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,),
          SizedBox(height: 5),
          TextFieldWidget_Card_input(
              passwordController: transportcard,
              hintextl: '16자리',
              isPassword: false),
        ],
      ),
    );
  }
}
