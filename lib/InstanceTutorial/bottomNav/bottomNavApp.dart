import 'package:flutter/material.dart';
import 'bottom_nav_widget.dart';
import 'irregular_bottom_appbar_widget.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottom nav',
      theme: ThemeData.fallback(),
//      home: BottomNavigationWidget(),
      home: IrregularBottomNavWidget(),
    );
  }
}
