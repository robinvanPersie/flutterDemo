import 'package:flutter/material.dart';
import 'each_view.dart';

/**
 * 不规则底部导航栏 eg:底部中间有加号
 */
class IrregularBottomNavWidget extends StatefulWidget {

  @override
  _IrregularBottomNavWidgetState createState() => _IrregularBottomNavWidgetState();
}

class _IrregularBottomNavWidgetState extends State<IrregularBottomNavWidget> {

  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView..add(EachView('Home'))
      ..add(EachView('Another'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return EachView('New Page');
          }));
        },
        tooltip: 'tooltip',
        child: Icon(Icons.add, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(), // 原型缺口矩形
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
