import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../../model/UseMultiProvider.dart';
import '../../CardRegister/TextFied_Card.dart';
import '../../CardRegister/TextFiekd_CardExpireDate_Block.dart';
import '../../SignUp/Widget_of_Name.dart';
import '../changeBankCard/TextFieldWidgetBankCard.dart';


class Info_Widget_Input_Card_Expire extends StatefulWidget {
  const Info_Widget_Input_Card_Expire({ required this.borderSide, required this.title, required this.value,
    Key? key,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;

  @override
  State<Info_Widget_Input_Card_Expire> createState() => _Info_Widget_Input_Card_NumberState();
}

class _Info_Widget_Input_Card_NumberState extends State<Info_Widget_Input_Card_Expire> {
  final transportcard = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
          Text(widget.title, style: loginText,),
          SizedBox(height: 10),
          Row(
              children: [
                Padding(padding: EdgeInsets.zero,),
                Expanded(
                    child: TextFieldCardExpireDate(
                      function: (String value){
                        stringprovider.setchangebankcardmonth(value);
                      },
                      passwordController: month,
                      hintextl: 'MM',
                      isPassword: false,
                    )),
                SizedBox(
                  child: Text('/', style: TextStyle(color: Colors.white)),
                ),
                Expanded(
                    child: TextFieldCardExpireDate(
                      function: (String value){
                        stringprovider.setchangebankcardyear(value);
                      },
                      passwordController: year,
                      hintextl: 'YY',
                      isPassword: false,
                    )),
              ]),
        ],
      ),
    );
  }


}