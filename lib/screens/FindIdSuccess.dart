import 'package:flutter/material.dart';

import '../components/FindId/FindIdSuccessBlock.dart';
import '../constant/constant.dart';

class FindSuccess extends StatefulWidget {
  const FindSuccess({Key? key}) : super(key: key);

  @override
  State<FindSuccess> createState() => _FindSuccessState();
}

class _FindSuccessState extends State<FindSuccess> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a475c),
        title: Text(appBarText),
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
            child: FindIdSuccessBlock() ,
          ),
        ),
      ),
    );
  }
}
