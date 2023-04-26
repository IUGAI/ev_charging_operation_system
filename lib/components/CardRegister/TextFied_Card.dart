import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../../model/UseMultiProvider.dart';

class TextFieldWidget_Card extends StatefulWidget {
  const TextFieldWidget_Card({
    Key? key,
    required this.passwordController,
    required this.hintextl,
    required this.isPassword,
  }) : super(key: key);

  final TextEditingController passwordController;
  final hintextl;
  final bool isPassword;

  @override
  _TextFieldWidget_CardState createState() => _TextFieldWidget_CardState();
}

class _TextFieldWidget_CardState extends State<TextFieldWidget_Card> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<DataMulti>(context, listen: false);
    widget.passwordController.text = provider.chargeCardNumber;
  }

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      height:  screenWidth > 900 || screenWidth > 600 ? 60 : 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff2d3748),
        border: Border.all(
          width: 0,
          color: Color(0xff2d3748),
        ),
      ),
      child: TextFormField(
        maxLength: 19, // include the hyphens
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
        controller: widget.passwordController,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),
        decoration: InputDecoration(
          hintText: widget.hintextl,
          hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onChanged: (value) {
          value = widget.passwordController.text;
          // Remove all non-digit characters from the string
          setState(() {
            String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

            // Split the digits into groups of four and join with hyphens
            String formattedText = digitsOnly.replaceAllMapped(
                RegExp(r'.{1,4}'), (match) => "${match.group(0)}-");

            // Remove the last hyphen if the text ends with one
            formattedText = formattedText.replaceAllMapped(
                RegExp(r'-$'), (match) => "");

            // Update the text in the text field
            widget.passwordController.value = TextEditingValue(
              text: formattedText,
              selection: TextSelection.collapsed(offset: formattedText.length),
            );
            print(value);
            stringprovider.getchargeCardNumber(widget.passwordController.text);
          });
        },
      ),
    );
  }
}
