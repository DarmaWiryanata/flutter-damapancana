import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:damapancana/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;

import 'models/carousel.dart';
import 'services/carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  CarouselService carouselService;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    carouselService = CarouselService();
  }

  List<Map<String, dynamic>> _listViewData = [
    {"title": "Lapor", "link": "http://damapancana.denpasarkota.go.id/home"},
    {"title": "Nomor Penting", "link": ""},
    {"title": "Daftar Kejadian", "link": ""},
    {"title": "About", "link": ""},
  ];

  @override
  Widget build(BuildContext context) {
    // CarouselService().getData().then((value) => print("value: $value"));
    return PlatformScaffold(
      appBar: PlatformAppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Damapancana Denpasar',
            style: TextStyle(color: Colors.black),
          ),
          android: (_) {
            return MaterialAppBarData(
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.black),
                  onPressed: () {},
                  tooltip: "Pemberitahuan",
                )
              ],
            );
          },
          ios: (_) {
            return CupertinoNavigationBarData(
                trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.notifications_none, color: Colors.black),
                    onPressed: () {},
                    tooltip: "Pemberitahuan"),
                IconButton(
                    icon: Icon(Icons.error, color: Colors.black),
                    onPressed: () {},
                    tooltip: "Tombol Darurat"),
              ],
            ));
          }),
      key: _scaffoldKey,
      android: (_) {
        return MaterialScaffoldData(
            floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.error),
          tooltip: "Tombol Darurat",
        ));
      },
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
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
                  GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(8.0),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 5.0,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, WebViewScreen.routeName,
                              arguments: ScreenArguments(
                                'Lapor',
                                'http://damapancana.denpasarkota.go.id/home',
                              ));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/checked.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Lapor',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/ringing-phone.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Nomor Penting',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, WebViewScreen.routeName,
                              arguments: ScreenArguments(
                                'Daftar Kejadian',
                                'http://damapancana.denpasarkota.go.id',
                              ));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/lifebuoy.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Daftar Kejadian',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/AboutScreen');
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'About',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Peta Rawan Bencana",
                        style: TextStyle(fontSize: 28),
                      )),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Rawan Angin Kencang',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Rawan Banjir',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Rawan Gempa',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Rawan Kekeringan',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Rawan Longsor',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.icons8.com/cute-clipart/100/000000/info.png",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Text(
                                  'Rawan Tsunami',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
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
      viewportFraction: 1.1,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.amber),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: carousels[index].thumbnailUrl,
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
                    carousels[index].title,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _modalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.looks_one),
                    title: new Text('Rawan Angin Kencang'),
                    onTap: () => {
                          Navigator.pushNamed(context, WebViewScreen.routeName,
                              arguments: ScreenArguments(
                                'Peta Rawan Angin Kencang',
                                'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/angin_kencang',
                              ))
                        }),
                new ListTile(
                  leading: new Icon(Icons.looks_two),
                  title: new Text('Rawan Banjir'),
                  onTap: () => {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: ScreenArguments(
                          'Peta Rawan Banjir',
                          'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/banjir',
                        ))
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.looks_3),
                  title: new Text('Rawan Gempa'),
                  onTap: () => {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: ScreenArguments(
                          'Peta Rawan Gempa',
                          'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/gempa',
                        ))
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.looks_4),
                  title: new Text('Rawan Kekeringan'),
                  onTap: () => {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: ScreenArguments(
                          'Peta Rawan Kekeringan',
                          'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/kekeringan',
                        ))
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.looks_5),
                  title: new Text('Rawan Longsor'),
                  onTap: () => {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: ScreenArguments(
                          'Peta Rawan Longsor',
                          'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/longsor',
                        ))
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.looks_6),
                  title: new Text('Rawan Tsunami'),
                  onTap: () => {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: ScreenArguments(
                          'Peta Rawan Tsunami',
                          'http://damapancana.denpasarkota.go.id/peta_rawan_bencana/tsunami',
                        ))
                  },
                ),
              ],
            ),
          );
        });
  }
}
