import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:webview_flutter/webview_flutter.dart';

class KejadianScreen extends StatelessWidget {
  static const routeName = '/kejadianScreen';

  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  KejadianScreen({
    Key key,
    @required this.title,
    @required this.selectedUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        body: Column(
      children: <Widget>[
        WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: MaterialButton(
              onPressed: () => {},
              child: Text('LOGIN'),
            ),
          ),
        ),
      ],
    ));
  }
}

class ScreenArguments {
  final String title;
  final String selectedUrl;

  ScreenArguments(this.title, this.selectedUrl);
}
