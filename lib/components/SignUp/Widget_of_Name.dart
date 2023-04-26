import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../../model/UseMultiProvider.dart';

class Widgetofname extends StatelessWidget {
  const Widgetofname({
    Key? key,required this.title, required this.function
  }) : super(key: key);

  final String title;
  final Function function;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final stringprovider = Provider.of<DataMulti>(context);
    return Container(
      height:  screenWidth > 900 || screenWidth > 600 ? 60 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xff2d3748),
          border: Border.all(
            width: 0,
            color: Color(0xff2d3748),
          ),
        ),
        child:  DropdownButtonFormField(
          value: '1',
          dropdownColor: Color(0xff2d3748),
          items: [
            DropdownMenuItem<String>(
              value: '1',
              child: Text('선택',style: TextStyle(color: Colors.grey, fontSize:  screenWidth > 900 || screenWidth > 600 ? 20 : 15)),
              enabled: false,
            ),
            DropdownMenuItem<String>(
                value: '98',
                child: Text('티머니',style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15),)
            ),
            DropdownMenuItem<String>(
                value: '99',
                child: Text('캐시비',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 20 : 15))
            ),
            DropdownMenuItem<String>(
                value: '100',
                child: Text('레일플러스',style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15))
            ),
            // Add more items here
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            hintText: title,
            hintStyle: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
            border: InputBorder.none,
          ),
          onChanged: (value) {
            function();
          },
        )

    );
  }
}