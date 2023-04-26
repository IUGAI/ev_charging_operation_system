import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:provider/provider.dart';

class TextFieldAuto extends StatelessWidget {
  const TextFieldAuto({
    Key? key, required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final stringprovider = Provider.of<DataMulti>(context);
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff232a38),
        border: Border.all(
          width: 0,
          color: Color(0xff232a38),
        ),
      ),
      child: TextFormField(
        initialValue: stringprovider.verificationmobileno,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        enabled: false,
        style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
        maxLength: 13,
        decoration: InputDecoration(
          hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
          border: InputBorder.none,
          contentPadding:
          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

        ),
        onChanged: (value) {
          if (value.length == 4 && value[3] != '-') {
            // Add a hyphen after the fourth character
            nameController.text = value.substring(0, 3) + '-' + value.substring(3);
            nameController.selection =
                TextSelection.collapsed(offset: nameController.text.length);
          } else if (value.length == 9 && value[8] != '-') {
            // Add a hyphen after the eighth character
            nameController.text = value.substring(0, 8) + '-' + value.substring(8);
            nameController.selection =
                TextSelection.collapsed(offset: nameController.text.length);
          }
          stringprovider.changePhone(value);
        },
        buildCounter: (BuildContext context,
            {int? currentLength, int? maxLength, bool? isFocused}) {
          if (currentLength == maxLength) {
            return null;
          }
          return Container(
            height: 0,
            width: 0,
          );
        },
      ),
    );
  }
}