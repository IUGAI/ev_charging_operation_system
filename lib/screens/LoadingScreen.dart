import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:ev_charging_operation_system/networking/getdatas.dart';
import 'package:ev_charging_operation_system/screens/MyPage.dart';

String tokens = '';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  var cityname;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokens = context.read<DataMulti>().accestokken;
    getlocation(tokens);
  }

  void getlocation(String token) async {
    // final provider =  Provider.of<DataMulti>(context);
    var weatherdata = await GetDatasmodel().getcityweather(token);
    var chargeata = await GetDatasmodel().getuserchargedata(token);
    var unpaid = await GetDatasmodel().getinpaidata(token);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MyPage(data: weatherdata,chargedata : chargeata, unpaid:  unpaid,);
    }));
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff3a475c),
        title: Text("NBplug", style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
      ),
      body: Container(
        color: Color(0xff27303f),
        child:  Container(
        ),
      ),
    );
  }
}
