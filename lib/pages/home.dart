import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/carousel.dart';
import '../models/daftarKejadian.dart';
import '../services/carousel.dart';
import '../services/daftarKejadian.dart';
import 'webview.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  CarouselService carouselService;
  DaftarKejadianService daftarKejadianService;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    carouselService = CarouselService();
    daftarKejadianService = DaftarKejadianService();
  }

  _panicNumber() async {
    const url = 'tel:+62361112112';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _ambulanceNumber() async {
    const url = 'tel:118';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(255, 82, 48, 1);
    return PlatformScaffold(
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        key: _scaffoldKey,
        appBar: PlatformAppBar(
            title: Text('Sipanter'.toUpperCase()),
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
        android: (_) {
          return MaterialScaffoldData(
              floatingActionButton: FloatingActionButton(
            onPressed: _panicNumber,
            child: Icon(Icons.error),
            tooltip: "Tombol Darurat",
          ));
        },
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(children: <Widget>[
              ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(color: primaryColor),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 3.0),
                            blurRadius: 15)
                      ]),
                  child: FutureBuilder(
                    future: carouselService.getData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Carousel>> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              "Something wrong with message: ${snapshot.error.toString()}"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        List<Carousel> profiles = snapshot.data;
                        return _buildCarouselSlider(profiles);
                      } else {
                        return Container(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0.0, 3.0),
                          blurRadius: 15)
                    ]),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30.0),
                      child: Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                          icon: Icon(Icons.check_box),
                                          padding: EdgeInsets.all(15),
                                          color: Colors.purple,
                                          iconSize: 30,
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                WebViewScreen.routeName,
                                                arguments: ScreenArguments(
                                                  'Lapor',
                                                  'http://damapancana.denpasarkota.go.id/home',
                                                ));
                                          })),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Lapor',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.blue.withOpacity(0.1),
                                      child: IconButton(
                                          icon: Icon(Icons.phone),
                                          padding: EdgeInsets.all(15),
                                          color: Colors.blue,
                                          iconSize: 30,
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/TeleponPage');
                                          })),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Nomor Penting',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.orange.withOpacity(0.1),
                                      child: IconButton(
                                          icon:
                                              Icon(FontAwesomeIcons.ambulance),
                                          padding: EdgeInsets.all(15),
                                          color: Colors.orange,
                                          iconSize: 30,
                                          onPressed: _ambulanceNumber)),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Ambulans',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ]),
                        SizedBox(height: 25),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.green.withOpacity(0.1),
                                      child: IconButton(
                                          icon: Icon(
                                              FontAwesomeIcons.cloudSunRain),
                                          padding: EdgeInsets.all(15),
                                          color: Colors.green,
                                          iconSize: 30,
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                WebViewScreen.routeName,
                                                arguments: ScreenArguments(
                                                  'Cuaca',
                                                  'http://balai3.denpasar.bmkg.go.id/cuaca-denpasar',
                                                ));
                                          })),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Cuaca',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.blue.withOpacity(0.1),
                                      child: IconButton(
                                          icon:
                                              Icon(FontAwesomeIcons.userShield),
                                          padding: EdgeInsets.all(15),
                                          color: Colors.blue,
                                          iconSize: 30,
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                WebViewScreen.routeName,
                                                arguments: ScreenArguments(
                                                  'Safecity',
                                                  'http://safecity.denpasarkota.go.id/home',
                                                ));
                                          })),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Safe City',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.orange.withOpacity(0.1),
                                      child: IconButton(
                                          icon: Icon(Icons.error),
                                          padding: EdgeInsets.all(15),
                                          color: Colors.orange,
                                          iconSize: 30,
                                          onPressed: _panicNumber)),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Darurat',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ]),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Text(
                'Kejadian Terkini',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            FutureBuilder(
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
                  return Container(
                    height: 200,
                    child: Center(
                      child: PlatformCircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Text(
                'Peta Rawan Bencana',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(width: 15),
                    UpcomingCard(
                        title: 'Rawan Angin Kencang',
                        link:
                            'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/angin_kencang',
                        color: Colors.purple),
                    UpcomingCard(
                        title: 'Rawan Banjir',
                        link:
                            'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/banjir',
                        color: Colors.blue),
                    UpcomingCard(
                        title: 'Rawan Gempa',
                        link:
                            'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/gempa',
                        color: Colors.orange),
                    UpcomingCard(
                        title: 'Rawan Kekeringan',
                        link:
                            'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/kekeringan',
                        color: Colors.pink),
                    UpcomingCard(
                        title: 'Rawan Longsor',
                        link:
                            'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/longsor',
                        color: Colors.green),
                    UpcomingCard(
                        title: 'Rawan Tsunami',
                        link:
                            'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/tsunami',
                        color: Colors.indigo),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 290.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final String link;
  final Color color;

  UpcomingCard({this.title, this.link, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, WebViewScreen.routeName,
            arguments: ScreenArguments(
              title,
              link,
            ));
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Container(
          width: 120.0,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                // SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCarouselSlider(List<Carousel> carousels) {
  return CarouselSlider.builder(
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    pauseAutoPlayOnTouch: Duration(seconds: 10),
    enlargeCenterPage: false,
    height: 200.0,
    viewportFraction: 1.0,
    itemCount: carousels.length,
    itemBuilder: (BuildContext context, int index) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: carousels[index].gambar,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black45
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  carousels[index].deskripsi,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        )),
  );
}

Widget _buildDaftarKejadian(List<DaftarKejadian> kejadian) {
  return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 1,
      itemBuilder: (context, index) {
        // DaftarKejadian kejadian = snapshot.data[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, WebViewScreen.routeName,
                arguments: ScreenArguments(
                  kejadian[index].title,
                  'https://www.himatistiki.id/blog/' + kejadian[index].slug,
                ));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    Text(kejadian[index].title,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text(kejadian[index].createdAt,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                    SizedBox(height: 15.0),
                    Divider(),
                    SizedBox(height: 5.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            'Lihat semua',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(width: 40),
                          Material(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blueAccent.withOpacity(0.1),
                            child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.blueAccent,
                                onPressed: () {}),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
