import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TentangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        appBar: PlatformAppBar(
          title: Text('Tentang'),
        ),
        body: ListView(
          children: <Widget>[
            Item(
              title: 'Developed by',
              description: 'BPBD Denpasar',
            ),
            Item(
              title: 'App version',
              description: '0.9.0',
            ),
          ],
        ));
  }
}

class Item extends StatelessWidget {
  final String title;
  final String description;

  Item({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(title,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(description,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
