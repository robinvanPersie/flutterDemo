import 'package:flutter/material.dart';
import 'custom_router.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('first page', style: TextStyle(fontSize: 36.0),), elevation: 4.0,),
      body: Center(child: MaterialButton(
          onPressed: () {
//            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//              return SecondPage();
//            }));
            Navigator.push(context, CustomRoute(SecondPage()));
          },
          child: Icon(Icons.navigate_next, color: Colors.white, size: 64.0,),
      ),),
    );
  }
}

/**
 * 第二个跳转页
 */
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
          title: Text('second page', style: TextStyle(fontSize: 36.0),),
          elevation: 0.0,
          backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: MaterialButton(
            child: Icon(Icons.navigate_before, color: Colors.white, size: 64.0,),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
    );
  }
}

