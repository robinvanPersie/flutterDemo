import 'package:flutter/material.dart';
import 'package:flutter_demo/tqx/model/product_bean.dart';

class ProductListPage extends StatefulWidget {

  final int index;

  ProductListPage({Key key, @required this.index}):super(key: key);

  @override
  _ProductListPageState createState() => new _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  List<Product> list;


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
            itemBuilder: _buildItem,
            itemCount: list == null ? 20 : list.length,
        ),
        onRefresh: _pullRefresh,
    );
  }

  Future _pullRefresh() {

  }

  Widget _buildItem(context, index) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
//          图片
//          Image.network(list[index].imageUrl),
          Container(
            width: 120.0,
            height: 120.0,
            child: Image.asset('images/dog.jpeg', fit: BoxFit.cover,),
          ),
//          标题
          Expanded(child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('我是商品名称我很长我想换行会出路障花纹吗，啊啊啊啊a啊aaa啊啊啊a啊', style: TextStyle(fontSize: 15.0), maxLines: 2, overflow: TextOverflow.ellipsis,),
//                原价 和 销量 row
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('原价 ¥49.9', style: TextStyle(fontSize: 13.0, color: Color(0xff666666), decoration: TextDecoration.lineThrough),),
                      Text('销量3832', style: TextStyle(fontSize: 13.0, color: Color(0xff666666),),),
                    ],
                  ),
                ),
//                立减 券后
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(5.0))),
                        child: Text('立减¥20', style: TextStyle(fontSize: 12.0, color: Colors.black,),),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(color: Color(0xff1384ff), borderRadius: BorderRadius.all(Radius.circular(5.0))),
                        child: Text('券后¥23.9', style: TextStyle(fontSize: 13.0, color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      ), // 第一个 Row
    );
  }
}


