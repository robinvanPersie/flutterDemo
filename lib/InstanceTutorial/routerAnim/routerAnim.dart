import 'package:flutter/material.dart';
import 'pages.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'router anim',
      theme: ThemeData(primaryColor: Colors.blue),
      home: FirstPage(),
    );
  }
}
