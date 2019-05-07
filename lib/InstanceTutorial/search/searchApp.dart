import 'package:flutter/material.dart';
import 'search_bar.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'search app',
      theme: ThemeData.light(),
      home: SearchBar(),
    );
  }
}
