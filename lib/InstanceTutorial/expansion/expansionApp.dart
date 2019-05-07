import 'package:flutter/material.dart';
import 'expansion_panel_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'expansion app',
      theme: ThemeData.dark(),
      home: ExpansionTileWidget(),
    );
  }
}

class ExpansionTileWidget extends StatefulWidget {

  @override
  _ExpansionTileWidgetState createState() => new _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expansion app bar '),),
      body: Center(
        child: ExpansionTile(
            title: Text('expansion tile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          initiallyExpanded: true,
          children: <Widget>[
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return EPLWidget();
                }));
              },
              title: Text('list tile'),
              subtitle: Text('sub title'),
            ),
          ],
        ),
      ),
    );
  }
}

