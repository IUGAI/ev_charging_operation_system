import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';

class Textfield_NumberCar extends StatefulWidget {
  const Textfield_NumberCar({
    Key? key,
    required this.hintextl,
    required this.isPassword,
  }) : super(key: key);

  final hintextl;
  final bool isPassword;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<Textfield_NumberCar> {
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
          maxLength: 15,
          onChanged: (value) {
            setState(() {
              stringprovider.getCarNumber(value);
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
          style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),
          decoration: InputDecoration(
            hintText: widget.hintextl,
            hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
            border: InputBorder.none,
            contentPadding:
            EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          )
      ),
    );
  }

}
