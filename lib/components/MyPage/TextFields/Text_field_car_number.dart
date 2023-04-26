import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';

class Text_field_car_number extends StatefulWidget {
  const Text_field_car_number({
    Key? key,
    required this.hintextl,
    required this.isPassword, required this.carnumbervalue,
  }) : super(key: key);

  final hintextl;
  final bool isPassword;
  final String carnumbervalue;
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<Text_field_car_number> {
  late String? setColor;
  Color colors = Color(0xff2d3748);

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff2d3748),
        border: Border.all(
          width: 0.3,
          color: colors,
        ),
      ),
      child: TextFormField(
        initialValue: widget.carnumbervalue,
        maxLength: 15,
        onChanged: (value) {
          setState(() {
            stringprovider.setCarNumber(value);
          });
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
        obscureText: widget.isPassword,
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 22 : 15),
        decoration: InputDecoration(
          hintText: widget.hintextl,
          hintStyle: loginText,
          border: InputBorder.none,
          contentPadding:
          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        ),
      ),
    );
  }


}
