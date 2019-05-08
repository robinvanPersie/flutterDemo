import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'swipe app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SwipeBack(),
    );
  }
}

class SwipeBack extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
          child: Container(
            height: 100.0,
            width: 100.0,
            color: CupertinoColors.activeBlue,
            child: CupertinoButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return SwipeBack();
                    })
                  );
                },
                child: Icon(Icons.add),
            ),
          ),
        ),
    );
  }
}
