import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPageIndex = 0;
  PageController _pageController = PageController();

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
        SliverPersistentHeader(
          pinned: true,
          delegate: _MSliverPersistentHeaderDelegate(
              Center(
                child: Text('persistent header'),
              )
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300.0,
            color: Colors.greenAccent,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: _pageChanged,
                itemBuilder: (context, index){
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(_buildItem, childCount: 20),
                  );
                },
                itemCount: 3,
            ),
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
      ],
    );
  }

  Widget _buildItem(context, index) {
    return Container(
      height: 44.0,
      child: Text('item: $index'),
    );
  }

  _pageChanged(int index) {
    setState(() {
       _currentPageIndex = index;
    });
  }

}

class _MSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

  final Widget child;

  _MSliverPersistentHeaderDelegate(@required this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
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