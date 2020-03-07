import 'package:damapancana/models/telepon.dart';
import 'package:damapancana/services/telepon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class TeleponPage extends StatefulWidget {
  TeleponPage({Key key}) : super(key: key);

  @override
  _TeleponPageState createState() => _TeleponPageState();
}

class _TeleponPageState extends State<TeleponPage> {
  var isLoading = false;

  TeleponService teleponService;

  @override
  void initState() {
    super.initState();
    teleponService = TeleponService();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(255, 82, 48, 1);
    return PlatformScaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: PlatformAppBar(
          title: Text('Nomor Penting'),
          android: (_) {
            return MaterialAppBarData(elevation: 0.0, actions: <Widget>[
              // IconButton(
              //     icon: Icon(Icons.notifications_none),
              //     color: Colors.white,
              //     iconSize: 30,
              //     onPressed: _panicNumber),
            ]);
          },
          ios: (_) {
            return CupertinoNavigationBarData(
                trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // IconButton(
                //     icon: Icon(Icons.notifications_none, color: Colors.black),
                //     onPressed: () {},
                //     tooltip: "Pemberitahuan"),
                IconButton(
                    icon: Icon(Icons.error, color: Colors.black),
                    onPressed: () {},
                    tooltip: "Tombol Darurat"),
              ],
            ));
          }),
      body: FutureBuilder(
        future: teleponService.getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Telepon>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Telepon> telepon = snapshot.data;
            return _buildTeleponList(telepon);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget _buildTeleponList(List<Telepon> telepon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0.0, 3.0),
                blurRadius: 15)
          ]),
      child: ListView.builder(
        itemCount: telepon.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              telepon[index].namaTelp,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(telepon[index].nomorTelp),
            trailing: IconButton(
                icon: Icon(Icons.phone, color: Colors.black),
                onPressed: () {
                  launch("tel:" + telepon[index].nomorTelp);
                },
                // onPressed: _teleponNumber(telepon[index].nomorTelp),
                tooltip: "Telepon"),
          );
        },
      ),
    ),
  );
}
