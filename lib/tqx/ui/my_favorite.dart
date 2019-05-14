import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {

  @override
  _FavoritePageState createState() => new _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text('我的收藏'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          MaterialButton(
            onPressed: null,
            child: Text('清空'),
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: 10,
          itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(context, index) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            height: 100.0,
            child: Image.network('', fit: BoxFit.cover,),
          ),
          Positioned(
            top: 110,
            left: 0,
            child: Text('title: sjdlajfskdjflskjflskjdflskdfjlsdkfsfsfsdf', maxLines: 2, overflow: TextOverflow.ellipsis,),
          ),
          Positioned(
            top: 130,
            child: Text('原价¥30.9', style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 13.0, color: Color(0xff666666),),),
          ),
          Positioned(
            top: 130,
            right: 0,
            child: Text('销量2342', style: TextStyle(fontSize: 13.0, color: Color(0xff666666),),),
          ),
        ],
      ),
    );
  }
}
