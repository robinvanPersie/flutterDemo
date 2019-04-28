import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'filmDetail.dart';

Dio dio = new Dio();

class MovieListSec extends StatefulWidget {

  MovieListSec({Key key, @required this.mt}) : super(key: key);

  final String mt;

  @override
  State<StatefulWidget> createState() => new _MovieListState();
}

class _MovieListState extends State<MovieListSec> with AutomaticKeepAliveClientMixin {

  int page = 1;
  int pageSize = 10;
  var list = [];
  int total = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    //header
    Widget buildHeaderItem(BuildContext ctx, int position) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Text('type: ${widget.mt}', style: TextStyle(fontSize: 14),),
      );
    }

    Widget buildListItem(BuildContext ctx, int position) {
      if (position == 0) {
        return buildHeaderItem(ctx, position);
      }
      var item = list[position - 1];
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
            return MovieDetail(id: item['id'], title: item['title'],);
          }));
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black87))),
          child: Row(children: <Widget>[
            Image.network(item['images']['medium'], width: 130, height: 180, fit: BoxFit.cover,),
            Container(
              height: 200,
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('电影名称：${item['title']}'),
                  Text('上映年份：${item['year']}'),
                  Text('电影类型：${item['genres'].join(', ')}'),
                  Text('豆瓣评分：${item['rating']['average']}'),
                  Row(
                    children: <Widget>[
                      Text('主要演员：${item['title']}'),
//                  CircleAvatar(backgroundImage: NetworkImage(item['casts']['avatars']['small']),)
                    ],
                  ),
                ],
              ),
            ), // container
          ],
          ),
        ),
      );
    }

    // 复用 使用builder
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext ctx, int i) {
          return buildListItem(ctx, i);
        });
  }

  // widget创建时执行
  @override
  void initState() {
    super.initState();
    _init();
    getMovieList();
    print('initState(): ${widget.mt}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies(): ${widget.mt}');
  }

  @override
  void didUpdateWidget(MovieListSec oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget(): ${widget.mt}');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate(): ${widget.mt}');
  }

  void _init() {
    dio.options.baseUrl = 'http://www.liulongbin.top:3005/';
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
  }


  getMovieList() async {
    // 偏移量 = (page - 1) * pageSize
    int offset = (page - 1) * pageSize;
//    const response = await dio.get('api/v2/movie/${widget.mt}?start=$offset&count=$pageSize');
    var response = dio.get('api/v2/movie/${widget.mt}', queryParameters: {'start': offset, 'count': pageSize});
    response.then((response) {
      setState(() {
        debugPrint(response.data.toString());
//          通过dio返回的数据，必须使用[]来访问
        list = response.data['subjects'];
        total = response.data['total'];
      });
    }).catchError(print);
  }
}