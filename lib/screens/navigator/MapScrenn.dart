import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/components/LoginBlock.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _LoginState();
}

class _LoginState extends State<MapScreen> {
  List<MyData> myDataList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response =
          await Dio().get('http://192.168.77.172:5000/locationmap');
      setState(() {
        myDataList = List<MyData>.from(
            response.data['data'].map((data) => MyData.fromJson(data)));
      });
      print(response.data['data']);
    } catch (error) {
      print(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a475c),
        title: Text(appBarText,
            style: TextStyle(
                fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Color(0xff26303f),
              child: Center(
                child: Text(
                  'Map Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }
}

class MyData {
  final double lat;
  final double lng;

  MyData({
    required this.lat,
    required this.lng,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
