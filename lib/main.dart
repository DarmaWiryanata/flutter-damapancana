import 'dart:async';
import 'package:damapancana/models/peringatan.dart';
import 'package:damapancana/pages/daftar_kejadian.dart';
import 'package:damapancana/pages/telepon_penting.dart';
import 'package:damapancana/services/peringatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;

import 'base.dart';
import 'pages/webview.dart';
import 'splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Brightness brightness = Brightness.light;
  Timer timer;
  PeringatanService peringatanService;
  List<Peringatan> peringatan;

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(
    //     Duration(seconds: 5), (Timer t) => checkForNewSharedLists());
  }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  final themeData = new ThemeData(
    fontFamily: 'Open Sans',
    primarySwatch: Colors.deepOrange,
  );

  final darkThemeData = new ThemeData(
    fontFamily: 'Open Sans',
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  );

  final cupertinoTheme = new CupertinoThemeData(
    primaryColor: Colors.deepOrange,
  );

  final cupertinoDarkTheme = new CupertinoThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
  );

  // ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
  //   launch("tel:+6287762149658");
  // });

  Future<Peringatan> checkForNewSharedLists() async {
    http.Response response = await http.get(
        Uri.encodeFull('https://damapancana.denpasarkota.go.id/api/peringatan'),
        headers: {"Accept": "application/json"});

    final data = peringatanService.getData();
    print(data);

    // String stat = data['status'];
    // if (stat == "1") {
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: false, // user must tap button!
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Rewind and remember'),
    //         content: SingleChildScrollView(
    //           child: ListBody(
    //             children: <Widget>[
    //               Text('You will never be satisfied.'),
    //               Text('You\’re like me. I’m never satisfied.'),
    //             ],
    //           ),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Regret'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

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
          "/BaseScreen": (BuildContext context) => BaseScreen(),
          "/KejadianPage": (BuildContext context) => KejadianPage(),
          "/SplashScreen": (BuildContext context) => SplashScreen(),
          "/TeleponPage": (BuildContext context) => TeleponPage(),
          // "/HomeScreen": (BuildContext context) => HomeScreen(),
          // "/AboutScreen": (BuildContext context) => AboutScreen(),
          // "/SampleScreen": (BuildContext context) => MyHomePage(title: "Home"),
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
