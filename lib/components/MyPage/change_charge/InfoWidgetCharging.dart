import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../../model/UseMultiProvider.dart';
import '../../SignUp/Widget_of_Name.dart';
import 'Wiget_choose.dart';

class Info_Widget_Charging extends StatelessWidget {
  const Info_Widget_Charging({ required this.borderSide, required this.title, required this.value,
    Key? key,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
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
          Text(title, style:screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,),
          SizedBox(height: 5),
          Widgetofname(title: '선택', function: (value){
            stringprovider.setnewchargecardtype(value!);
          },)
        ],
      ),
    );
  }
}
