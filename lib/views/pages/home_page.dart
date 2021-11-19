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
  int _currentFragmentIndex = 0;

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentFragmentIndex,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            elevation: 24.0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              size: 20.0,
              color: Colors.black,
            ),
            unselectedIconTheme: const IconThemeData(
              size: 20.0,
              color: Colors.grey,
            ),
            type: BottomNavigationBarType.fixed,
            onTap: (index) async {
              var controller = await _controller.future;
              var currentUrl = '';
              switch (index) {
                case 0:
                  currentUrl = 'https://getappd.io/';
                  break;
                case 1:
                  currentUrl = 'https://getappd.io/why-apps-work-better/';
                  break;
                case 2:
                  currentUrl = 'https://getappd.io/how-it-work/';
                  break;
                case 3:
                  currentUrl = 'https://getappd.io/pricing/';
                  break;
              }
              if (_currentFragmentIndex != index) {
                controller.loadUrl(currentUrl);
                setState(() {
                  _currentFragmentIndex = index;
                  _loading = true;
                });
              }
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Benefits',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.assessment,
                    color: Colors.grey,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.assessment,
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Steps',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.assignment,
                    color: Colors.grey,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.assignment,
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Pricing',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.grey,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
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
                onPageStarted: (url) {
                  if (!_loading) {
                    setState(() {
                      _loading = true;
                    });
                  }
                },
                onProgress: (url) {
                  if (!_loading) {
                    setState(() {
                      _loading = true;
                    });
                  }
                },
              ),
              if (_loading)
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      'assets/img/color-loading.gif',
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
