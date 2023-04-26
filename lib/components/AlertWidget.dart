import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/screens/FIndphone.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/screens/Login.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:provider/provider.dart';

import '../screens/Agreement.dart';
import '../screens/LoadingScreen.dart';


class AlertShowSuccessSendEmail extends StatelessWidget {
  const AlertShowSuccessSendEmail({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color:  Color(0xff92d051),
                        width: 3
                      ),
                      color:  Color(0xff26303f)
                  ),
                  child:
                  Icon(Icons.check, color: Color(0xffbbd1ad),size: 40,)),
              SizedBox(
                height: 20,
              ),
              Text(
                'SUCCESS',
                style: TextStyle(color: Color(0xff92d051), fontSize: 15),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            '회원님 $message',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff92d051)
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ]));
  }
}

class AlertShowSuccessCardChanged extends StatelessWidget {
  const AlertShowSuccessCardChanged({
    required this.message,
    Key? key, required this.function,
  }) : super(key: key);

  final String message;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color:  Color(0xff92d051),
                          width: 3
                      ),
                      color:  Color(0xff26303f)
                  ),
                  child:
                  Icon(Icons.check, color: Color(0xffbbd1ad),size: 40,)),
              SizedBox(
                height: 20,
              ),
              Text(
                'SUCCESS',
                style: TextStyle(color: Color(0xff92d051), fontSize: 15),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff92d051)
            ),
            onPressed: () {
              function();

            },
            child: Text('OK'),
          ),
        ]));
  }
}



class AlertShowFailSendEmail extends StatelessWidget {
  const AlertShowFailSendEmail({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return AlertDialog(
        title: Center(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(screenWidth > 900 || screenWidth > 600 ? 20 : 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color:  Color(0xfffec100),
                          width: 3
                      ),
                      color:  Color(0xff26303f)
                  ),
                  child:
                  Icon(Icons.close, color: Color(0xffffce3a),size: screenWidth > 900 || screenWidth > 600 ? 60 :  40)),
              SizedBox(
                height: 20,
              ),
              Text(
                'WARNING',
                style: TextStyle(color: Color(0xfffec100), fontSize: screenWidth > 900 || screenWidth > 600 ?  23 : 15),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            '회원님 $message',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfffec100)
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ]));
  }
}

class AlertShow extends StatelessWidget {
  const AlertShow({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return AlertDialog(
        title: Center(
            child: Column(children: [
                Icon(Icons.warning_amber, color: Color(0xff0aaff0),size: screenWidth > 900 || screenWidth > 600 ? 60 :  40),
              SizedBox(
                height: screenWidth > 900 || screenWidth > 600 ? 40 : 20,
              ),

              Text(
                'NOTICE',
                style: TextStyle(color: Color(0xff0aaff0), fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK' , style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15),),
          ),
        ]));
  }
}

class AlertShowCheckFiled extends StatelessWidget {
  const AlertShowCheckFiled({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'NOTICE',
                style: TextStyle(color: Color(0xff0aaff0)),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
           '$message \n 로그인 페이지로 이동하시겠습니까?',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text('OK'),
          ),
        ]));
  }
}


class AlertShowSignSuccess extends StatelessWidget {
  const AlertShowSignSuccess({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    return AlertDialog(
        title: Center(
            child: Column(children: [
              // Image(image: AssetImage('img/icons/png.png'), fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text(
                'NOTICE',
                style: TextStyle(color: Color(0xff0aaff0)),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              stringprovider.getcardtype('');
              stringprovider.getchargecardcompnay('');
              stringprovider.getchargeCardNumber('');
              stringprovider.getCarNumber('');
              stringprovider.getid('');
              stringprovider.getbithday('');
              stringprovider.getgender('');
              stringprovider.chagnePassword('');
              stringprovider.changeName('');
              stringprovider.changePhone('');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ),
              );
            },
            child: Text('OK'),
          ),
        ]));
  }
}


class AlertUpdateSuccess extends StatelessWidget {
  const AlertUpdateSuccess({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    return AlertDialog(
        title: Center(
            child: Column(children: [
              // Image(image: AssetImage('img/icons/png.png'), fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text(
                'NOTICE',
                style: TextStyle(color: Color(0xff0aaff0)),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoadingScreen();
                  },
                ),
              );
            },
            child: Text('OK'),
          ),
        ]));
  }
}



class AlertDeleteSuccess extends StatelessWidget {
  const AlertDeleteSuccess({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    return AlertDialog(
        title: Center(
            child: Column(children: [
              // Image(image: AssetImage('img/icons/png.png'), fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text(
                'NOTICE',
                style: TextStyle(color: Color(0xff0aaff0)),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ),
              );
            },
            child: Text('OK'),
          ),
        ]));
  }
}


class AlertFailFindPhone extends StatelessWidget {
  const AlertFailFindPhone({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'NOTICE',
                style: TextStyle(color: Color(0xff0aaff0)),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Findphone();
                  },
                ),
              );
            },
            child: Text('OK'),
          ),
        ]));
  }
}



class AlertFindPhoneSuccess extends StatelessWidget {
  const AlertFindPhoneSuccess({
    required this.User_id,
    Key? key, required this.Name,
  }) : super(key: key);

  final String User_id;
  final String Name;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue
                  ),
                  child:
              Icon(Icons.check, color: Colors.white,size: 40,)),
              SizedBox(
                height: 20,
              ),
              Text(
                '${Name} 님의 아이디 정보입니다.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ])),
        backgroundColor: Color(0xff26303f),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            User_id,
            style: loginText,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ),
              );
            },
            child: Text('로그인하기'),
          ),
        ]));
  }
}