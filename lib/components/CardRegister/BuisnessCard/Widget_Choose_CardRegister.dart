import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../../../model/UseMultiProvider.dart';

class Wudget_choose_Card_Register extends StatelessWidget {
  const Wudget_choose_Card_Register({
    Key? key,required this.title
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: screenWidth > 900 || screenWidth > 600 ? 60 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xff2d3748),
          border: Border.all(
            width: 0,
            color: Color(0xff2d3748),
          ),
        ),
        child: Center(
          child: DropdownButtonFormField(
            value: '',
            dropdownColor: Color(0xff2d3748),
            items: [
              DropdownMenuItem<String>(
                value: '',
                child: Text('선택',style: TextStyle(color: Colors.grey, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
              ),

            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              hintText: title,
              hintStyle:  screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
              border: InputBorder.none,
            ),
            onChanged: (value) {

              // Handle item selection
            },
          ),
        )

    );
  }
}