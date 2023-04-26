// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:ev_charging_operation_system/screens/Agreement.dart';
import 'package:ev_charging_operation_system/screens/FIndphone.dart';
import 'package:ev_charging_operation_system/screens/Sign_up.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../components/AlertWidget.dart';
import '../model/UseMultiProvider.dart';
import '../networking/getdatas.dart';
import 'FIndPhoneIdSuccess.dart';
// #enddocregion platform_imports

String error = '';
String UserId = '';
String? name;

enum Navigators {
  close,
  default_v,
  success,
}

class WebpageFindPhone extends StatefulWidget {
  const WebpageFindPhone({super.key});

  @override
  State<WebpageFindPhone> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebpageFindPhone> {
  late final WebViewController _controller;
  Navigators selectednav = Navigators.default_v;
  Timer? _timer;
  bool _shouldNavigate = false;
  String? currentUrl;


  String kTransparentBackgroundPage = '''<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
   body{
   background-color: black;
   }
  </style>
</head>
<body onload="document.form_chk.submit()">
  <div class="home">
    <!-- nice 서버에 submit할 form -->
    <form name="form_chk" method="post" action="https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb">
      <input type="hidden" name="m" value="checkplusService">
      <input type="hidden" name="EncodeData" value="AgAFQlk3OTXqRe9zRwALFB/lUyU4ejbqqkh8iJGAQN0BKP7hyZ3BXxSc8X8hbGUqPe2rDan7D/5/LhzUW1d1ONaty6obGdT+au2O8jtKUnfcXrz8+u1lQFEJJ/ZaWOCJAVsNFN+8wINQ9lU24i4X3cZzYlRpM9HSpD7uX82I+kQ3SD7bfGoHPMRJhHkEYudoe4vwnpu0DWjcul8Wu+JRWmt8iIuyfbHpTyDk9rM+yDy5BuptTHMQvhDL0sPoDfNhNhX+WW97HkdL712yCIWfuO/642Eg0kYvsh2NwcTyvg0fXZpj2NMJowBI2cCYX+ZKOWdf3/mz/zjZ1vrPYtcuFgr0RErzp08kb8pE0fka8wMx5nk5O7GWH+gfkxu7R4ZBOHdGH044g6Atoeeu6zAHGfhPb+Time+ufmhvAiTVIDWE39ne9/kuJa73WtUVBZiZZyAqOA1Gz/3B8KZtIu8p3IN1X/Ke7cc8">
    </form>
  </div>
</body>
</html>
''';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      currentUrl = await _controller.currentUrl();
      print(currentUrl);
      if (currentUrl?.substring(0, 36) ==
          'http://ev.namboo.co.kr/nice/success?') {
        Uri uri = Uri.parse(currentUrl!);
        name = uri.queryParameters["name"]?.replaceAll("+",' ');
        String? birthdate = uri.queryParameters["birthdate"];
        String? gender = uri.queryParameters["gender"];
        String? mobileno = uri.queryParameters["mobileno"];
        var weatherdata = await checkuser(
            context,
            name!,
            mobileno!.substring(0, 3) +
                '-' +
                mobileno!.substring(3, 7) +
                '-' +
                mobileno!.substring(7));
        print(weatherdata);
        _timer?.cancel();
        if (weatherdata['msg'] == '조회를 완료하였습니다.' && weatherdata['data']['id'] != '') {
          _timer?.cancel();
          UserId = weatherdata['data']['id'];
          selectednav = Navigators.success;
          _shouldNavigate = true;
        } else {
          _timer?.cancel();
          return showMyDialog(context, weatherdata['msg']);
        }
        // stop the timer
        setState(() {}); // update the UI to navigate to another page
      } else if (currentUrl == 'https://nice.checkplus.co.kr/Common/close.cb') {
        _timer?.cancel();
        _shouldNavigate = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Findphone()),
        );
      }
    });

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xff26303f))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadHtmlString(kTransparentBackgroundPage);

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
    // getlocation(site!);
  }

  void getlocation(String token) async {
    // final provider =  Provider.of<DataMulti>(context);
  }

  @override
  void dispose() {
    _timer?.cancel(); // cancel the timer when the widget is disposed
    super.dispose();
  }

  // void getlocation(String sites) async  {
  //   // final provider =  Provider.of<DataMulti>(context);
  //
  // }

  @override
  Widget build(BuildContext context) {
    if (_shouldNavigate) {
      // navigate to another page if the condition is true
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (selectednav == Navigators.success) {
          showMyDialogSuccess(context,name!,UserId);
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3a475c),
        title: Text("EV총전인프라 운영시스템"),
      ),
      backgroundColor: Colors.green,
      body: WillPopScope(
          onWillPop: () async {
            if (Navigator.of(context).userGestureInProgress)
              return false;
            else
              return true;
          },
          child: WebViewWidget(controller: _controller)),
    );
  }
}

Future<dynamic> checkuser(
    BuildContext context, String name, String phone) async {
  var networking_data = await data(context, name, phone);
  return networking_data;
}

Future data(BuildContext context, String name, String phone) async {
  try {
    final dio = Dio();
    final response = await dio.get(
        'http://139.150.72.173:3000/user/id',
        queryParameters: {'name': name, 'phone': phone});
    if (response.statusCode == 200) {
      return response.data;
    }
  } catch (e) {
    if (e is DioError) {
      // Print the error message and response data
      print('Error: ${e.message}');
      error = e.response?.data['msg'];
    } else {
      // Print the generic error message
      print('Error: $e');
    }
    return showMyDialog(context, '입력하신 회원 정보와 본인 인증 정보가 일치하지 않습니다.');
  }
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertFailFindPhone(message: msg);
    },
  );
}


void showMyDialogSuccess(BuildContext context, String name, String userID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertFindPhoneSuccess(User_id: userID, Name: name,);
    },
  );
}