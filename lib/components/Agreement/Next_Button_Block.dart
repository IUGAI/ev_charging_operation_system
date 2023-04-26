import 'dart:async';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ev_charging_operation_system/screens/webpage.dart';
import 'package:ev_charging_operation_system/screens/Sign_up.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_location_href/window_location_href.dart';


Timer? _timer;
const url = "http://ev.namboo.co.kr/use_terms?cp=1";
final uri = Uri.parse(url);
class Next_Button extends StatefulWidget {

  const Next_Button({
    Key? key,
  }) : super(key: key);

  @override
  State<Next_Button> createState() => _Next_ButtonState();
}

class _Next_ButtonState extends State<Next_Button> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Code to be executed every second
      setState(() {
        // print('${uri.origin}${uri.path}');
        // print('12 21${href}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 70),
      width: double.infinity,
      child: ElevatedButton(
        child: Text('다음', style: TextStyle(fontWeight: FontWeight.w900, fontSize: screenWidth > 900 || screenWidth > 600 ? 24 : 16),),
        onPressed: ()async {
          // makePostRequests('AgAFQlk3OTXqRe9zRwALFB/lUyU4ejbqqkh8iJGAQN0BKP7hyZ3BXxSc8X8hbGUqPe2rDan7D/5/LhzUW1d1ONaty6obGdT+au2O8jtKUnfcXrz8+u1lQFEJJ/ZaWOCJAVsNFN+8wINQ9lU24i4X3cZzYlRpM9HSpD7uX82I+kQ3SD7bfGoHPMRJhHkEYudoe4vwnpu0DWjcul8Wu+JRWmt8iIuyfbHpTyDk9rM+yDy5BuptTHMQvhDL0sPoDfNhNhX+WW97HkdL712yCIWfuO/642Eg0kYvsh2NwcTyvg0fXZpj2NMJowBI2cCYX+ZKOWdf3/mz/zjZ1vrPYtcuFgr0RErzp08kb8pE0fka8wMx5nk5O7GWH+gfkxu7R4ZBOHdGH044g6Atoeeu6zAHGfhPb+Time+ufmhvAiTVIDWE39ne9/kuJa73WtUVBZiZZyAqOA1Gz/3B8KZtIu8p3IN1X/Ke7cc8', context);
          // if (await canLaunchUrl(uri))
          // await launchUrl(uri);
          // else
          // // can't launch url, there is some error
          // throw "Could not launch $url";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WebViewExample();
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, ),
          primary: Color(0xff02aff0),
          onPrimary: Colors.white, // set the text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // set the border radius

          ),
        ),
      ),
    );
  }
}

class _MyHomePageState {
}

void fetchData() async {
  final url = '211';
  try {
    final response = await Dio().get(url);
    // Do something with the response data
    print(response.data['data']['encData']);
    String encdate = response.data['data']['encData'];
  } catch (error) {
    // Handle the error
    print(error);
  }
}

void makePostRequest(String data, BuildContext context) async {
  try {
    var dio = Dio();
    var url = 'https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb';
    var formData = FormData.fromMap({
      'm': 'checkplusService',
      'EncodeData': data
    });
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var response2 = await dio.post(
      url,
      data: formData,
      options: Options(headers: headers),
    );
    print(response2.data);
    print('aas');
  } catch (error) {
    print(error);
  }
}



void makePostRequests(String data,BuildContext context) async {
  var url = Uri.parse('https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: {  'm': 'checkplusService',
      'EncodeData': data},
  );
  print(response.body);

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) {
  //       return WebViewPage(htmlContent: response.body);
  //     },
  //   ),
  // );
}