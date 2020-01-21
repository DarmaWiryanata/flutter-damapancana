import 'package:damapancana/home.dart';
import 'package:damapancana/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Brightness brightness = Brightness.light;

  // Android theme
  final themeData = new ThemeData(
    primarySwatch: Colors.deepOrange,
  );

  final darkThemeData = new ThemeData(
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

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformApp(
        home: SplashScreen(),
        title: 'Flutter Demo',
        routes: <String, WidgetBuilder>{
          "/SplashScreen": (BuildContext context) => SplashScreen(),
          "/HomeScreen": (BuildContext context) => HomeScreen(),
          // "/WebPageScreen": (BuildContext context) => WebPageScreen(),
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
