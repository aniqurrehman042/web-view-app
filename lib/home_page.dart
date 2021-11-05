import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> _controller = Completer();
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    var shortestScreenSide = MediaQuery.of(context).size.shortestSide;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          if (!_controller.isCompleted) {
            return false;
          }
          var controller = await _controller.future;
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              WebView(
                initialUrl: 'https://www.getappd.io',
                gestureNavigationEnabled: true,
                allowsInlineMediaPlayback: true,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) =>
                    _controller.complete(controller),
                onPageFinished: (url) {
                  if (_loading) {
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              ),
              if (_loading)
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      'assets/img/logo.png',
                      height: shortestScreenSide * 0.8,
                      width: shortestScreenSide * 0.8,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
