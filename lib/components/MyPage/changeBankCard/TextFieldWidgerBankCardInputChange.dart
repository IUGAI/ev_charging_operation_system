import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../../../model/UseMultiProvider.dart';

class TextFieldWidget_Bank_Card_input_x4 extends StatefulWidget {
  const TextFieldWidget_Bank_Card_input_x4({
    Key? key,
    required this.passwordController,
    required this.hintextl,
    required this.isPassword, required this.obscureText, required this.function
  }) : super(key: key);

  final TextEditingController passwordController;
  final hintextl;
  final bool isPassword;
  final bool obscureText;
  final Function function;

  @override
  _TextFieldWidget_CardState createState() => _TextFieldWidget_CardState();
}

class _TextFieldWidget_CardState extends State<TextFieldWidget_Bank_Card_input_x4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<DataMulti>(context, listen: false);
    // widget.passwordController.text = provider.newvalueofchargecardnumner;
    print(provider.chargeCardNumber);
  }

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff2d3748),
        border: Border.all(
          width: 0,
          color: Color(0xff2d3748),
        ),
      ),
      child: TextFormField(
        maxLength: 4, // include the hyphens
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
        obscureText: widget.obscureText,
        cursorColor: Colors.white,
        controller: widget.passwordController,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white , fontSize:  screenWidth > 900 || screenWidth > 600 ? 20 : 15),
        decoration: InputDecoration(
          hintText: widget.hintextl,
          hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onChanged: (value) {

          widget.function(value);

        },
      ),
    );
  }
}



