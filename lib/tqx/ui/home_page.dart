import 'package:flutter/material.dart';
import 'sub/product_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

var title = ['精选推荐', '女装', '男装', '内衣', '母婴', '化妆品', '家居',
'鞋包配饰', '美食', '文体车品', '数码家电'];

var banners = ['ic_banner_first.png', 'ic_banner_second.png'];

TabController _tabController;

// home_page 最外层
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: title.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: title.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                height: 150.0,
                color: Colors.lightBlue,
                child: Swiper(
                    itemBuilder: (context, index) {
                      return Image.asset('images/3.0/' + banners[index], fit: BoxFit.cover,);
                    },
                    itemCount: 2,
                    autoplay: true,
//                    每一页停留时间
                    autoplayDelay: 3000,
//                    切换过程的时间
                    duration: 1000,
//                      left right arrow
//                    control: SwiperControl(),
//                      point
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Colors.grey,
                      ),
                    ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _MSliverPersistentHeaderDelegate(
                child: TabBarLayout(),
              ),
            ),
          ];
        },
        body: TabBarVP(controller: _tabController),
      ),
    );
  }
}

// appbarLayout
class _MSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

  final Widget child;

  _MSliverPersistentHeaderDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent
        || minExtent != oldDelegate.minExtent;
  }
}

// tabBarLayout
class TabBarLayout extends StatefulWidget {

  @override
  _TabBarLayoutState createState() => new _TabBarLayoutState();
}

class _TabBarLayoutState extends State<TabBarLayout> {

  Color _primaryColor, _normalColor;

  @override
  void initState() {
    super.initState();
    _primaryColor = Color(0xff1384ff);
    _normalColor = Colors.black;
  }

  List<Widget> _buildTab() {
    return title.map((item) =>
        Text('$item', style: TextStyle(fontSize: 15),)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: TabBar(
          tabs: _buildTab(),
          controller: _tabController,
          isScrollable: true,
          indicatorColor: _primaryColor,
          labelColor: _primaryColor,
          unselectedLabelColor: _normalColor,
      ),
    );
  }
}

// 与tabBarLayout 配合的 viewPager
class TabBarVP extends StatelessWidget {

  final TabController controller;

  TabBarVP({@required this.controller});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [];
    for (int i = 0; i < 11; i++) {
      pages.add(ProductListPage(index: i));
    }
    return TabBarView(
        children: pages,
        controller: controller,
    );
  }
}

