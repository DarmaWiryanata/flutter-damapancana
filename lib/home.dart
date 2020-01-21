import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemList = [
      'https://global.unitednations.entermediadb.net/assets/mediadb/services/module/asset/downloads/preset/assets/2018/10/10-10-2018-UNICEF-Indonesia-Sulawesi-tsunami-disaster-UN0239946.jpg/image1170x530cropped.jpg',
      'https://www.incimages.com/uploaded_files/image/970x450/getty_844768902_299186.jpg',
      'https://scx1.b-cdn.net/csz/news/800/2018/naturaldisas.jpg',
      'https://cdn1.expresscomputer.in/wp-content/uploads/2019/11/18125734/Natural-Disaster-Flood.jpg',
      'https://assets.weforum.org/article/image/large_xOGqNN6AyIUstjh7PBLAGswiD8IgVHONfO2jm59uQ7M.jpg'
    ];

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Damapancana Denpasar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Lambang_Kota_Denpasar_%281%29.png/252px-Lambang_Kota_Denpasar_%281%29.png',
              height: 100,
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
                        child: Image.network(
                          '$i',
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 25),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://img.icons8.com/cute-clipart/100/000000/checked.png")),
                    ),
                    Text('Lapor')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://img.icons8.com/cute-clipart/100/000000/warning-shield.png")),
                    ),
                    Text('Panic')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://img.icons8.com/cute-clipart/100/000000/map-marker.png")),
                    ),
                    Text('Peta Bencana')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://img.icons8.com/cute-clipart/100/000000/ringing-phone.png")),
                    ),
                    Text('Nomor Penting')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://img.icons8.com/cute-clipart/100/000000/lifebuoy.png")),
                    ),
                    Text('Daftar Kejadian')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://img.icons8.com/cute-clipart/100/000000/info.png")),
                    ),
                    Text('About')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
