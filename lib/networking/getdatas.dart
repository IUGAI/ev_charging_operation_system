import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'networking.dart';

class GetDatasmodel{

  Future<dynamic> getcityweather(String token) async {
    NetworkHelper networkhelper = NetworkHelper();
    var weatherData = await networkhelper.data(token);
    return weatherData;
  }

  Future<dynamic> getuserchargedata(String token) async {
    NetworkHelper networkhelper = NetworkHelper();
    var weatherData = await networkhelper.datas(token);
    return weatherData;
  }


  Future<dynamic> getinpaidata(String token) async {
    NetworkHelper networkhelper = NetworkHelper();
    var weatherData = await networkhelper.datas_unpaid(token);
    return weatherData;
  }

  Future<dynamic> checkuser(String name, String phone) async {
    NetworkHelper_check networkhelper = NetworkHelper_check();
    var networking_data = await data(name, phone);
    return networking_data;
  }

  Future data(String name, String phone) async {
    try {
      final dio = Dio();
      final response = await dio.get('http://139.150.72.173:3000/member/user/exist-member',queryParameters: {'name' : name, 'phone' : phone });
      if (response.statusCode == 200){
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future datas() async {
    try {
      final dio = Dio();
      final response = await dio.get('http://139.150.72.173:3000/user/charge/list');
      if (response.statusCode == 200){
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}






