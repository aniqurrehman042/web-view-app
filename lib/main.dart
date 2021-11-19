import 'dart:async';

import 'package:appd/views/pages/home_page.dart';
import 'package:appd/views/pages/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
