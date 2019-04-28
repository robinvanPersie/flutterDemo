import 'package:flutter/material.dart';

void main() => runApp(NavigatorApp());

class NavigatorApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navigator tutorial',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('navigation'),),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) {
                    return SecondScreen();
                  }),
              );
            },
            child: Text('jump to next page'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('i am next page'),),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('back', style: TextStyle(fontSize: 50.0),),
        ),
      ),
    );
  }
}