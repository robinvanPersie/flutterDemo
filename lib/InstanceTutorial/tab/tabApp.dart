import 'package:flutter/material.dart';
import 'keep_alive_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tab app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: KeepAliveTab(),
    );
  }
}

class KeepAliveTab extends StatefulWidget {
  @override
  _KeepAliveTabState createState() => new _KeepAliveTabState();
}

class _KeepAliveTabState extends State<KeepAliveTab> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tab Keep Alive'),
          bottom: TabBar(
              controller: _controller,
              tabs: [
                Tab(icon: Icon(Icons.directions_car),),
                Tab(icon: Icon(Icons.directions_transit),),
                Tab(icon: Icon(Icons.directions_bike),),
              ],
          ),
      ),
      body: TabBarView(
          controller: _controller,
          children: [
            TabHomePage(),
            TabHomePage(),
            TabHomePage(),
          ],
      ),
    );
  }
}

