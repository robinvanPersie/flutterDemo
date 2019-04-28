import 'package:flutter/material.dart';

//void main() => runApp(new TextApp());
void main() => runApp(new ContainerApp());

class TextApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'text widget',
      home: Scaffold(
        body: Center(
          child: Text(
            'hello jspang 着西装打呔，摞大哥电话有乜用呀，虾？跟著咁大佬，吔屎啦你',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 255, 125, 125),
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'container widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text('多谢乌蝇哥', style: TextStyle(fontSize: 40.0),),
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 400.0,
//            color: Colors.lightBlue,
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.lightGreen, Colors.purpleAccent],
                ),
                border: Border.all(width: 2.0, color: Colors.redAccent)
            ),
          ),
        ),
      ),
    );
  }
}