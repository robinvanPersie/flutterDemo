import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tooltip app',
      theme: ThemeData.light(),
      home: ToolTipWidget(),
    );
  }
}

class ToolTipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tooltip'),),
      body: Center(
        child: Tooltip(
            message: '汪汪汪',
          child: Image.asset('images/dog.jpeg'),
        ),
      ),
    );
  }
}


