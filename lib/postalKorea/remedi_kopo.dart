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
import 'package:ev_charging_operation_system/postalKorea/src/kopo_model.dart';
import 'package:ev_charging_operation_system/screens/Agreement.dart';
import 'package:ev_charging_operation_system/screens/CardRegister.dart';
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
// #enddocregion platform_imports

String error = '';

class Remedicopo extends StatefulWidget {
  const Remedicopo(
      {super.key,
      this.title = '주소검색',
      this.colour = Colors.white,
      this.apiKey = '',
      this.callback});

  final String title;
  final Color colour;
  final String apiKey;
  final Function? callback;

  @override
  State<Remedicopo> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<Remedicopo> {
  late final WebViewController _controller;
  Timer? _timer;
  bool _shouldNavigate = false;
  String? currentUrl;
  String? name;

  @override
  void initState() {
    super.initState();

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
      ..loadRequest(Uri.parse('https://studio-b-co-kr.github.io/kopo/assets/daum.html'))
      ..addJavaScriptChannel(
        'onComplete',
        onMessageReceived: (JavaScriptMessage message) {
          KopoModel result = KopoModel.fromJson(jsonDecode(message.message));

          if (widget.callback != null) {
            widget.callback!(result);
          }

          Navigator.pop(context, result);
        },
      );

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

  @override
  Widget build(BuildContext context) {
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
