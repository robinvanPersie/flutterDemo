import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';

/**
 * 用户widget交互
 */

//void main() => runApp(new _TapBoxAApp());
//void main() => runApp(new _TapBoxBApp());
//void main() => runApp(new _TapBoxCApp());
//void main() => runApp(new TutorialHome());
void main() => runApp(new RaisedApp());

//**************** widget管理自己的状态

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    var gestureDetector = new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(_active ? 'Active' : 'Inactive', style: new TextStyle(fontSize: 32.0, color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
    return gestureDetector;
  }
}

class _TapBoxAApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TapBoxA',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('boxA bar'),
        ),
        body: new Center(
          child: new TapBoxA(),
        )
      ),
    );
  }
}

//******************* 父widget管理widget的状态

class ParentWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget container = new Container(
      child: new TapBoxB(active: _active, onChanged: _handleTapBoxChanged),
    );
    return container;
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  bool active;
  ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    var gestureDetector = new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(active ? 'Active' : 'Inactive', style: new TextStyle(fontSize: 32.0, color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
    return gestureDetector;
  }
}

class _TapBoxBApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TapBoxB',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('boxB bar'),
          ),
          body: new Center(
            child: new ParentWidget(),
          )
      ),
    );
  }
}

//*************** 混合管理 *********


class ParentWidgetC extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _ParentWidgetStateC();
}

class _ParentWidgetStateC extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}



class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return new GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color:
          widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,
        ),
      ),
    );
  }
}

class _TapBoxCApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TapBoxC',
      home: Scaffold(
          appBar: AppBar(
            leading: new Icon(Icons.wifi),
            title: new Text('boxC bar'),
          ),
          body: new Center(
            child: new ParentWidgetC(),
          )
      ),
    );
  }
}

//*************** Navigator ******************
class TutorialHome extends StatelessWidget {

  void pressedCallback() {
    debugPrint('pressed');
  }

  @override
  Widget build(BuildContext context) {

    var scaffold = new Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), tooltip: 'navigation menu', onPressed: pressedCallback),
        title: Text('exmaple title'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), tooltip: 'Search', onPressed: null),
          IconButton(icon: Icon(Icons.share), onPressed: null,)
        ],
      ),
      body: Center(
        child: Text('I AM BODY'),
      ),
      floatingActionButton: FloatingActionButton(tooltip: 'floatingBtn Add', child: Icon(Icons.add), onPressed: null),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );

    var app = new MaterialApp(
      title: 'app title',
      home: scaffold,
    );

    return app;
  }
}

//************** raised button  **************
class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {

  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var row = new Row(
      children: <Widget>[
        RaisedButton(onPressed: _increment, child: Text('Increment'),),
        Text('Count: $_counter')
      ],
    );

    return row;
  }
}

class RaisedApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'raised',
      home: Scaffold(
        appBar: AppBar(
          title: Text('raised bar'),
        ),
        body: Counter(),
      ),
    );
  }
}