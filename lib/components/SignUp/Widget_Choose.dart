import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../../model/UseMultiProvider.dart';

class Wudget_choose extends StatelessWidget {
  const Wudget_choose({
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
                enabled: false,
              ),
              DropdownMenuItem<String>(
                  value: '4',
                  child: Text('EV6',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '5',
                  child: Text('EV7',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '8',
                  child: Text('G80',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '6',
                  child: Text('GV60',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '7',
                  child: Text('GV70',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '12',
                  child: Text('i3',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '13',
                  child: Text('i4',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '15',
                  child: Text('iX',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '14',
                  child: Text('iX3',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '11',
                  child: Text('나로 EV',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '10',
                  child: Text('봉고 EV',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '1',
                  child: Text('아이오닉 EV',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '2',
                  child: Text('아이오닉 5',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '3',
                  child: Text('아이오닉 6',style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '16',
                  child: Text('코란도 이모션',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
              DropdownMenuItem<String>(
                  value: '9',
                  child: Text('포터 2EV',style: TextStyle(color: Colors.white,  fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),)
              ),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              hintText: title,
              hintStyle: screenWidth > 900 || screenWidth > 600  ? loginText_l : loginText,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              stringprovider.setchangecarname(value!);
              print(value);
              // Handle item selection
            },
          ),
        )

    );
  }
}