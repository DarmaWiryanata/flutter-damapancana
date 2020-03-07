import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'pages/daftar_kejadian.dart';
import 'pages/home.dart';
import 'pages/tentang.dart';

class BaseScreen extends StatefulWidget {
  // int currentPage;

  // BaseScreen({
  //   Key key,
  //   this.currentPage,
  // }) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedPage = 0;
  final _pageOptions = [HomePage(), KejadianPage(), TentangPage()];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: _pageOptions[_selectedPage],
      bottomNavBar: PlatformNavBar(
        currentIndex: _selectedPage,
        itemChanged: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Container(height: 0.0),
          ),
        ],
      ),
    );
  }
}
