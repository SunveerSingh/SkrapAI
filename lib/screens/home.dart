import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:skrapai/screens/history.dart';
import 'package:skrapai/screens/map.dart';
import 'package:skrapai/screens/scanner.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  const HomeScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screens = [
      CameraaScreen(camera: widget.camera),
      MapScreen(),
      HistoryScreen()
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        animationDuration: Duration(milliseconds: 200),
        color: Colors.black,
        height: 50,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.greenAccent,
          ),
          Icon(
            Icons.pin_drop,
            size: 30,
            color: Colors.greenAccent,
          ),
          Icon(
            Icons.history,
            size: 30,
            color: Colors.greenAccent,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: screens[_page],
    );
  }
}
