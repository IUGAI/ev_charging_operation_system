import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:provider/provider.dart';

class Passportdata extends StatelessWidget {
  const Passportdata({
    Key? key,
    required TextEditingController passportController_date,
    required TextEditingController passportController_gender,
  }) : _passportController_date = passportController_date, _passportController_gender = passportController_gender, super(key: key);

  final TextEditingController _passportController_date;
  final TextEditingController _passportController_gender;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final stringprovider = Provider.of<DataMulti>(context);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff232a38),
              border: Border.all(
                width: 0,
                color: Color(0xff232a38),
              ),
            ),
            child:  TextFormField(
              initialValue: stringprovider.verificationidcard.substring(2),
              maxLength: 6,
              enabled: false,
              onChanged: (value) {
                stringprovider.getbithday(value);
              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
              decoration: InputDecoration(
                hintStyle: loginText,
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              ),
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
          ),
        ),
        Text('-', style: TextStyle(color: Colors.white, fontSize: 20),),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff232a38),
              border: Border.all(
                width: 0,
                color: Color(0xff232a38),
              ),
            ),
            child:  TextFormField(
              initialValue: stringprovider.verificationgender,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              enabled: false,
              style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
              maxLength: 1,
              onChanged: (value) {
                stringprovider.getgender(value);
              },
              decoration: InputDecoration(
                hintStyle: loginText,
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              ),

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
          ),
        ),
        Expanded(child: Text('******', style: TextStyle(fontSize: 22, color: Colors.white),))

      ],
    );
  }
}