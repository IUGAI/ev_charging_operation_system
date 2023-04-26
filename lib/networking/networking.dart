import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/screens/Login.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import '../components/AlertWidget.dart';
import '../screens/LoadingScreen.dart';

class NetworkHelper {
  Future changechargecard(
      var provider, BuildContext context, String error) async {
    String newcardnumber = provider.newvalueofchargecardnumner;
    String newcardtype = provider.newchargecardtype;
    final dio = Dio();
    final token = provider.accestokken;

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final data = {
      'cardCompanyIdx': newcardtype,
      'cardNumber': newcardnumber,
      'cardPassword': "1111"
    };

    final jsonBody = jsonEncode(data);

    try {
      final response = await dio.patch(
        'http://139.150.72.173:3000/user/charge-card',
        data: jsonBody,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        // Success handling code here
        print(response.data);
        showMyDialogSuccessChangeCard(context, response.data['msg']);
      } else {
        // Error handling code here
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Error handling code here
      if (e is DioError) {
        // Print the error message and response data
        print('Error: ${e.message}');
        error = e.response?.data['msg'];
      } else {
        // Print the generic error message
        print('Error: $e');
      }
      return showMyDialogerror(context, '${error}');
    }
  }

  Future data(String token) async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('${host_server}/user/my-page');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future getfindphone(String name, String phone) async {
    try {
      final dio = Dio();
      final response =
          await dio.get('${host_server}/user/id?name=${name}&phone=${phone}');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future datas(String token) async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('${host_server}/user/charge/list');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future datas_unpaid(String token) async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('${host_server}/user/unpaid/list');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future registerUser(
      String id,
      String passwordController,
      String name,
      String bithday,
      String gender,
      String phone,
      String cardtype,
      String carname,
      String chargecardcompnay,
      String chargeCardNumber,
      String bank_card_number,
      String bank_card_month,
      String bank_card_year,
      String bank_card_password,
      String carNumber,
      BuildContext context) async {
    String error = '';
    try {
      Dio dio = Dio();
      String url = "http://139.150.72.173:3000/user/";

      // Define the JSON request body
      Map<String, dynamic> requestBody = {
        "email": id,
        "pw": passwordController,
        "name": name,
        "birth": bithday,
        "gender": int.parse(gender),
        "phone": phone,
        "companyIdx": 1,
        "registType": 1,
        "cardType": int.parse(cardtype),
        'carIdx': carname,
        'carNumber' : carNumber,
        "chargeCardCompanyIdx": int.parse(chargecardcompnay),
        "chargeCardNumber": chargeCardNumber,
        "cardNo": bank_card_number.replaceAll('-', ''),
        "expYear": bank_card_month,
        "expMonth": bank_card_year,
        "cardPw": bank_card_password
      };

      // Encode the JSON request body
      String requestBodyJson = json.encode(requestBody);

      // Make the POST request with Dio
      Response response = await dio.post(
        url,
        data: requestBodyJson,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // Print the response data
      print(response.data);
      showMyDialog(context, response.data['msg']);
    } catch (e) {
      // Handle any errors that may occur
      if (e is DioError) {
        // Print the error message and response data
        print('Error: ${e.message}');
        error = e.response?.data['msg'];
      } else {
        // Print the generic error message
        print('Error: $e');
      }
      return showMyDialogerror(context, error);
    }
  }

  Future changeCard(
      var provider,
      BuildContext context,
      String cardnumber,
      creditCardExpireYear,
      creditCardExpireMonth,
      bithday,
      creditCardpassword,
      String error) async {
    final dio = Dio();
    final token = provider.accestokken;

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final data = {
      'cardNo': cardnumber,
      'expYear': creditCardExpireYear,
      'expMonth': creditCardExpireMonth,
      'birth': bithday,
      'cardPw': creditCardpassword
    };

    final jsonBody = jsonEncode(data);

    try {
      final response = await dio.post(
        'http://139.150.72.173:3000/user/edit/bill-key',
        data: jsonBody,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        // Success handling code here
        print(response.data);
        showMyDialogSuccessChangeCard(context, '결제카드 수정 되었습니다');
      } else {
        // Error handling code here
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Error handling code here
      if (e is DioError) {
        // Print the error message and response data
        print('Error: ${e.message}');
        error = e.response?.data['msg'];
      } else {
        // Print the generic error message
        print('Error: $e');
      }
      return showMyDialogerror(context, error);
    }
  }

  void showMyDialogerror(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertShow(message: msg);
      },
    );
  }

  void showMyDialogSuccessChangeCard(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertShowSuccessCardChanged(
          message: '${msg}',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoadingScreen();
                },
              ),
            );
          },
        );
      },
    );
  }
}

class NetworkHelper_check {
  Future data(String name, String phone) async {
    try {
      final dio = Dio();
      final response = await dio.get('${host_server}/member/user/exist-member',
          queryParameters: {'name': name, 'phone': phone});
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShowSuccessCardChanged(message: msg, function: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Login();
            },
          ),
        );
      },);
    },
  );
}

void showMyDialogError(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg);
    },
  );
}