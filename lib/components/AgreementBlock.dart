import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/screens/Sign_up.dart';
import 'Agreement/Agreement_Block.dart';
import 'Agreement/Next_Button_Block.dart';
import 'Agreement/Check_Box_Block.dart';
class AgreementBlock extends StatefulWidget {
  const AgreementBlock({Key? key}) : super(key: key);

  @override
  State<AgreementBlock> createState() => _AgreementBlockState();
}

class _AgreementBlockState extends State<AgreementBlock> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
         padding: screenWidth > 900  ? EdgeInsets.symmetric(horizontal: 150) : EdgeInsets.all(0),
        color: Color(0xff1d1e28),
        child: Center(
          child: Column(
            children: [
              Agreement_Block(),
              SizedBox(height: 30),
              CheckBox_Block(isChecked: _isChecked),
              Next_Button()
            ],
          ),
        ));
  }
}




