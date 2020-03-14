import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../models/daftarKejadian.dart';
import '../services/daftarKejadian.dart';
import 'webview.dart';

class KejadianPage extends StatefulWidget {
  @override
  _KejadianPageState createState() => _KejadianPageState();
}

class _KejadianPageState extends State<KejadianPage> {
  var isLoading = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  DaftarKejadianService daftarKejadianService;

  @override
  void initState() {
    super.initState();
    daftarKejadianService = DaftarKejadianService();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  Future<Null> _refresh() async {
    return daftarKejadianService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: PlatformAppBar(
        title: Text('Daftar Kejadian'),
        trailingActions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: FutureBuilder(
          future: daftarKejadianService.getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<DaftarKejadian>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<DaftarKejadian> kejadian = snapshot.data;
              return _buildDaftarKejadian(kejadian);
            } else {
              return Center(
                child: PlatformCircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildDaftarKejadian(List<DaftarKejadian> kejadian) {
  return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: kejadian.length,
      itemBuilder: (context, index) {
        // DaftarKejadian kejadian = snapshot.data[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, WebViewScreen.routeName,
                arguments: ScreenArguments(
                  kejadian[index].judulKejadian,
                  'https://damapancana.denpasarkota.go.id/kejadiandetail3/' +
                      kejadian[index].idKejadian.toString(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0.0, 3.0),
                        blurRadius: 15)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.show_chart,
                      size: 40,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    SizedBox(height: 50.0),
                    Text(kejadian[index].judulKejadian,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text(kejadian[index].tanggalKejadian,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
