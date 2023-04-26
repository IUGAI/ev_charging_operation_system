

import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/components/AgreementBlock.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/MyAppGuideBlock.dart';
import 'Sign_up.dart';
class AppGuide extends StatefulWidget {
  const AppGuide({Key? key, required this.guide}) : super(key: key);
  final String guide;

  @override
  State<AppGuide> createState() => _AgreementState();
}

class _AgreementState extends State<AppGuide> {


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff27313f),
          title: Text("NBplug", style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (Navigator.of(context).userGestureInProgress)
              return false;
            else
              return true;
          },
          child: Container(
              color: Color(0xff27313f),
              child: MyAppBlock(data:  widget.guide,)),
        )
    );
  }
}
