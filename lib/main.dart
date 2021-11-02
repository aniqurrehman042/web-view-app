import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Completer<WebViewController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App'd",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: WillPopScope(
          onWillPop: () async {
            if (!_controller.isCompleted) {
              return false;
            }
            var controller = await _controller.future;
            if(await controller.canGoBack()) {
              controller.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
            body: WebView(
              initialUrl: 'https://getappd.io',
              gestureNavigationEnabled: true,
              allowsInlineMediaPlayback: true,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) => _controller.complete(controller),
            ),
          ),
        ),
      ),
    );
  }
}
