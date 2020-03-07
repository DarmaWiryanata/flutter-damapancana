import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            countDownTime();
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('not connected'); // show dialog
      }
    });
  }

  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => PlatformAlertDialog(
        title: Text("Tidak ada koneksi internet"),
        content: Text("Diperlukan koneksi internet untuk mengakses aplikasi"),
        actions: <Widget>[
          FlatButton(
              child: Text("Keluar"),
              onPressed: () => Theme.of(context).platform == TargetPlatform.iOS
                  ? exit(0)
                  : SystemNavigator.pop())
        ],
      ),
    );
  }

  countDownTime() async {
    Timer(Duration(seconds: 1), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Navigator.of(context).pushReplacementNamed('/BaseScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: FlutterLogo(
        size: 100,
      )),
    );
  }
}
