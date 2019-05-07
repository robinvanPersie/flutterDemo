import 'package:flutter/material.dart';
import 'frosted_glass.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'frosted glass app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: FrostedClassDemo(),
      ),
    );
  }
}
