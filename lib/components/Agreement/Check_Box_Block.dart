import 'package:flutter/material.dart';


class CheckBox_Block extends StatelessWidget {
  const CheckBox_Block({
    Key? key,
    required bool isChecked,
  }) : _isChecked = isChecked, super(key: key);

  final bool _isChecked;

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
          Checkbox(
            activeColor: Colors.blue, // set the color of the checkbox when it is checked
            checkColor: Colors.white,
            value: _isChecked,
            onChanged: (bool? value) {

            },
          )
        ],
      ),
    );
  }
}