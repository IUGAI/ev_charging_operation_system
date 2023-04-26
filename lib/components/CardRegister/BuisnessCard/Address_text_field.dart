import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:provider/provider.dart';

class Addresstextfield extends StatefulWidget {
  const Addresstextfield({
    Key? key, required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  State<Addresstextfield> createState() => _AddresstextfieldState();
}

class _AddresstextfieldState extends State<Addresstextfield> {
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
         controller: widget.nameController,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        enabled: false,
        style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
        maxLength: 13,
        decoration: InputDecoration(
          hintStyle: loginText,
          border: InputBorder.none,
          contentPadding:
          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

        ),
        onChanged: (value) {

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