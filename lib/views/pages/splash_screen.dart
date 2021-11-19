import 'dart:async';

import 'package:appd/views/pages/startup_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  bool _init = false;

  @override
  Widget build(BuildContext context) {
    var shortestScreenSide = MediaQuery.of(context).size.shortestSide;

    if (!_init) {
      Timer(const Duration(milliseconds: 2500), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StartupPage()));
      });
      _init = true;
    }

    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/img/logo.png',
          height: shortestScreenSide * 0.8,
          width: shortestScreenSide * 0.8,
        ),
      ),
    );
  }
}
