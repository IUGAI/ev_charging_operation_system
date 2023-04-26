import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';

import '../../../postalKorea/remedi_kopo.dart';
import '../../../postalKorea/src/kopo_model.dart';
import '../../AlertWidget.dart';
import '../../kpostal.dart';

class Btnandtext extends StatefulWidget {
  const Btnandtext({
    Key? key,
    required this.hintextl,
    required this.isPassword, this.function, required this.postalcodecontoller,
  }) : super(key: key);

  final hintextl;
  final bool isPassword;
  final function;
  final TextEditingController postalcodecontoller;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<Btnandtext> {
  late String? setColor;
  String addressJSON = '';
  Color colors = Color(0xff2d3748);

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: Container(
        height:  screenWidth > 900 || screenWidth < 600 ? 60 : 50,
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
       controller: widget.postalcodecontoller,
          maxLength: 15,
          enabled: false,
          onChanged: (value) {
            setState(() {
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
          style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth < 600 ? 23 : 15),
          decoration: InputDecoration(
            hintText: widget.hintextl,
            hintStyle: loginText,
            border: InputBorder.none,
            contentPadding:
            EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          ),
        ),
      ),
    );
  }

}


void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg);
    },
  );
}



