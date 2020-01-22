import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:damapancana/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;

    var itemList = [
      'https://global.unitednations.entermediadb.net/assets/mediadb/services/module/asset/downloads/preset/assets/2018/10/10-10-2018-UNICEF-Indonesia-Sulawesi-tsunami-disaster-UN0239946.jpg/image1170x530cropped.jpg',
      'https://www.incimages.com/uploaded_files/image/970x450/getty_844768902_299186.jpg',
      'https://scx1.b-cdn.net/csz/news/800/2018/naturaldisas.jpg',
      'https://cdn1.expresscomputer.in/wp-content/uploads/2019/11/18125734/Natural-Disaster-Flood.jpg',
      'https://assets.weforum.org/article/image/large_xOGqNN6AyIUstjh7PBLAGswiD8IgVHONfO2jm59uQ7M.jpg'
    ];

    return PlatformScaffold(
      // appBar: PlatformAppBar(
      //   title: Text('Damapancana Denpasar'),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                    "https://2.bp.blogspot.com/-Vqz9rlENhKU/WZqUQwgzSlI/AAAAAAAAAbs/x1fiWNQujEQ-J8gLSBBvaq8o7ml4Xxn5QCLcBGAs/s1600/Lambang_Kota_Denpasar_%25281%2529.png",
                height: 100,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 25),
              Text('Denpasar Mantap Penanggulangan Bencana'.toUpperCase()),
              Text('Dauh Puri Kaja, North Denpasar, Denpasar City, Bali 80233'),
              SizedBox(height: 25),
              CarouselSlider(
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                enlargeCenterPage: true,
                height: 200.0,
                items: itemList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: CachedNetworkImage(
                            imageUrl: '$i',
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ));
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 25),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, WebViewScreen.routeName,
                                arguments: ScreenArguments(
                                  'Lapor',
                                  'http://damapancana.denpasarkota.go.id/home',
                                ));
                          },
                          child: Center(
                              child: CachedNetworkImage(
                            imageUrl:
                                "https://img.icons8.com/cute-clipart/100/000000/checked.png",
                            height: 100,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )),
                        ),
                      ),
                      Text('Lapor')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Center(
                          child: InkWell(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://img.icons8.com/cute-clipart/100/000000/warning-shield.png",
                              height: 100,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Text('Panic')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            _modalBottomSheet(context);
                          },
                          child: Center(
                              child: CachedNetworkImage(
                            imageUrl:
                                "https://img.icons8.com/cute-clipart/100/000000/map-marker.png",
                            height: 100,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )),
                        ),
                      ),
                      Text('Peta Bencana')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Center(
                            child: CachedNetworkImage(
                          imageUrl:
                              "https://img.icons8.com/cute-clipart/100/000000/ringing-phone.png",
                          height: 100,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )),
                      ),
                      Text('Nomor Penting')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, WebViewScreen.routeName,
                                arguments: ScreenArguments(
                                  'Daftar Kejadian',
                                  'http://damapancana.denpasarkota.go.id',
                                ));
                          },
                          child: Center(
                              child: CachedNetworkImage(
                            imageUrl:
                                "https://img.icons8.com/cute-clipart/100/000000/lifebuoy.png",
                            height: 100,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )),
                        ),
                      ),
                      Text('Daftar Kejadian')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Center(
                            child: CachedNetworkImage(
                          imageUrl:
                              "https://img.icons8.com/cute-clipart/100/000000/info.png",
                          height: 100,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )),
                      ),
                      Text('About')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
