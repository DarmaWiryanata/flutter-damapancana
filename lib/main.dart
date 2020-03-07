import 'package:damapancana/pages/telepon_penting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shake/shake.dart';
import 'package:url_launcher/url_launcher.dart';

import 'base.dart';
import 'pages/webview.dart';
import 'splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Brightness brightness = Brightness.light;

  // Android theme
  final themeData = new ThemeData(
    fontFamily: 'Open Sans',
    primarySwatch: Colors.deepOrange,
  );

  final darkThemeData = new ThemeData(
    fontFamily: 'Open Sans',
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  );

  // iOS theme
  final cupertinoTheme = new CupertinoThemeData(
    primaryColor: Colors.deepOrange,
  );

  final cupertinoDarkTheme = new CupertinoThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
  );

  ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
    launch("tel:+6287762149658");
  });

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformApp(
        home: SplashScreen(),
        title: 'Flutter Demo',
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == WebViewScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments args = settings.arguments;

            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return WebViewScreen(
                  title: args.title,
                  selectedUrl: args.selectedUrl,
                );
              },
            );
          }
        },
        routes: <String, WidgetBuilder>{
          // "/HomeScreen": (BuildContext context) => HomeScreen(),
          // "/AboutScreen": (BuildContext context) => AboutScreen(),
          // "/SampleScreen": (BuildContext context) => MyHomePage(title: "Home"),
          "/SplashScreen": (BuildContext context) => SplashScreen(),
          "/BaseScreen": (BuildContext context) => BaseScreen(),
          "/TeleponPage": (BuildContext context) => TeleponPage(),
          // "/LaporScreen": (BuildContext context) => WebPageScreen(title: '', selectedUrl: ''),
        },
        android: (_) {
          return MaterialAppData(
            theme: themeData,
            darkTheme: darkThemeData,
            themeMode: brightness == Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
        ios: (_) {
          return CupertinoAppData(
              theme: brightness == Brightness.light
                  ? cupertinoTheme
                  : cupertinoDarkTheme);
        },
      ),
    );
  }
}
