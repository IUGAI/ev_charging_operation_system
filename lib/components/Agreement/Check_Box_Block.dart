import 'package:ev_charging_operation_system/components/AlertWidget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';


class CheckBox_Block extends StatefulWidget {
  const CheckBox_Block({
    Key? key,
    required bool isChecked,
  }) : _isChecked = isChecked, super(key: key);

  final bool _isChecked;

  @override
  State<CheckBox_Block> createState() => _CheckBox_BlockState();
}

class _CheckBox_BlockState extends State<CheckBox_Block> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('모두동의',style: TextStyle(
             fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15,
              color: Colors.white
          ),),
            Row(children: [
            // Container(
            //   height: 20,
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: Color(0xff73829E)),
            //       onPressed: () {
            //             return showMyDialog(context, textagreement);
            //       },
            //       child: const Text('전문보기')),
            // ),
            Checkbox(
              activeColor: Colors
                  .blue, // set the color of the checkbox when it is checked
              checkColor: Colors.white,
              value: widget._isChecked,
              onChanged: (bool? value) {
                setState(() {
        
                });
              },
            ),
          ])
        ],
      ),
    );
  }
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return  AlertShowAgreementBlockscss(message: msg, function: (){
              Navigator.pop(context);
      });
    },
  );
}
