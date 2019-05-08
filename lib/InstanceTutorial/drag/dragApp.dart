import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'drag app',
      theme: ThemeData.dark(),
      home: DragPage(),
    );
  }
}

// 拖拽控件
class DragRectWidget extends StatefulWidget {

  final Offset offset;
  final Color widgetColor;

  DragRectWidget({Key key, this.offset, this.widgetColor}):super(key: key);

  @override
  _DragRectWidgetState createState() => new _DragRectWidgetState();
}

class _DragRectWidgetState extends State<DragRectWidget> {

  Offset _offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
          data: widget.widgetColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.widgetColor,
          ),
          feedback: Container(
            width: 110.0,
            height: 110.0,
            color: widget.widgetColor.withOpacity(0.6),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              this._offset = offset;
            });
          },
      ),
    );
  }
}

// UI
class DragPage extends StatefulWidget {

  @override
  _DragPageState createState() => new _DragPageState();
}

class _DragPageState extends State<DragPage> {

  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DragRectWidget(
            offset: Offset(80.0, 80.0),
            widgetColor: Colors.tealAccent,
          ),
          DragRectWidget(
            offset: Offset(200.0, 80.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
                onAccept: (color) {
                  setState(() {
                    _draggableColor = color;
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    color: _draggableColor,
                  );
                }),
          ),
        ],
      ),
    );
  }
}



