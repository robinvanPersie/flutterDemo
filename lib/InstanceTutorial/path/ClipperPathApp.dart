import 'package:flutter/material.dart';
import 'clipper_path.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'path and Bessel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home:  ClipperPath(),
    );
  }
}
