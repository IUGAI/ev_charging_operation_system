import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/components/MypageBlock.dart';
import 'package:provider/provider.dart';

import '../model/UseMultiProvider.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.data, this.chargedata, this.unpaid}) : super(key: key);

  final data;
  final chargedata;
  final unpaid;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return WillPopScope(
      onWillPop: () {
        return Future(()=>false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3a475c),
          automaticallyImplyLeading: false,
          title: Text("NBplug", style: TextStyle(fontSize:  screenWidth > 900 || screenWidth > 600  ? 23 : 15),),
          actions: [
            IconButton(
              icon: Icon(Icons.logout, size:  screenWidth > 900 || screenWidth > 600 ? 30 : 24,),
              onPressed: () async {
                 String token = stringprovider.refreshtokken;
                 final dio = Dio();
                 final url = 'http://139.150.72.173:3000/auth/logout';

                 try {
                   final response = await dio.delete(
                     url,
                     data:  {
                       "refreshToken" : token
                     },
                   );
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) {
                         return Login();
                       },
                     ),
                   );
                 } catch (e) {
                   print(e);
                 }
              },
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (Navigator.of(context).userGestureInProgress)
              return false;
            else
              return true;
          },
          child: Container(
            color: Color(0xff26303f),
            child:  Center(
              child : MyPageBlock(datass: widget.data, datas: 'charge', chargedata: widget.chargedata,unpaiddata:  widget.unpaid,),
            ),
          ),
        ),
      ),
    );
  }
}
