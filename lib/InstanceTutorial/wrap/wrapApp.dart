import 'package:flutter/material.dart';
import 'wrap_home.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wrap app',
      theme: ThemeData.light(),
      home: WrapHome(),
    );
  }
}
