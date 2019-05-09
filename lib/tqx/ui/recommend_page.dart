import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {

  @override
  _RecommendPageState createState() => new _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 50.0,
            color: Colors.greenAccent,
            child: Text('sliver to box adapter'),
          ),
        ),
//        SliverAppBar(
//          title: Text('sliver appbar'),
          // 固定在上面
//          pinned: true,
          // title里的文字 向下滚入，向上滚出
//          floating: false,
          // CollapsingToolbarLayout 效果，但是文字也会消失
//          expandedHeight: 100.0,
//          flexibleSpace: FlexibleSpaceBar(
//            title: Text('flexible Space'),
//            background: Image.asset('images/dog.jpeg', fit: BoxFit.cover,),
//          ),
//        ),
//        SliverSafeArea(
//          sliver: SliverPadding(padding: EdgeInsets.all(10.0), sliver: Text('sliver safe area'),),
//        ),

        SliverPersistentHeader(
          pinned: true,
          delegate: _MSliverPersistentHeaderDelegate(
            Center(
              child: Text('persistent header'),
            )
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(_buildItem, childCount: 20),
        ),
      ],
    );
  }

  Widget _buildItem(context, index) {
    return Container(
      height: 44.0,
      child: Text('item: $index'),
    );
  }
}

class _MSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

  final Widget child;

  _MSliverPersistentHeaderDelegate(@required this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent
    || minExtent != oldDelegate.minExtent;
  }

}