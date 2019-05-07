import 'package:flutter/material.dart';
import 'pages/HomeScreen.dart';
import 'pages/EmailScreen.dart';
import 'pages/PagesScreen.dart';
import 'pages/AirplayScreen.dart';

class BottomNavigationWidget extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<BottomNavigationWidget> {

  final _color = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    super.initState();
    list
    ..add(HomeScreen())
    ..add(EmailScreen())
    ..add(PagesScreen())
    ..add(AirplayScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _color,),
              title: Text('Home', style: TextStyle(color: _color),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.email, color: _color,),
              title: Text('Email', style: TextStyle(color: _color),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.pages, color: _color,),
              title: Text('Pages', style: TextStyle(color: _color),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplay, color: _color,),
              title: Text('Airplay', style: TextStyle(color: _color),)
            ),
          ],
        currentIndex: _currentIndex,
        onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
        },
      ),
    );
  }
}
