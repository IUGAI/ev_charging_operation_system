import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../../model/UseMultiProvider.dart';
import '../../CardRegister/TextFied_Card.dart';
import '../../CardRegister/TextFiekd_CardExpireDate_Block.dart';
import '../../CardRegister/TextField_CardPassword_Block.dart';
import '../../SignUp/Widget_of_Name.dart';
import '../changeBankCard/TextFieldWidgetBankCard.dart';


class Info_Widget_Input_Card_Password extends StatefulWidget {
  const Info_Widget_Input_Card_Password({ required this.borderSide, required this.title, required this.value,
    Key? key,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;

  @override
  State<Info_Widget_Input_Card_Password> createState() => _Info_Widget_Input_Card_NumberState();
}

class _Info_Widget_Input_Card_NumberState extends State<Info_Widget_Input_Card_Password> {
  final transportcard = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final stringprovider = Provider.of<DataMulti>(context);
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: widget.borderSide
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,),
          SizedBox(height: 10),
          Row(
              children: [
                Expanded(
                    child: TextFieldCardPasswordBlock(
                      function: (String value){
                        print(value);
                        stringprovider.setchangebankcardpassword(value);
                      },
                      passwordController: password,
                      hintextl: '',
                      isPassword: true,
                    )),
                Expanded(
                    child: Text("**", style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 30 : 20,  color: Colors.white),)),
              ]),
        ],
      ),
    );
  }
}