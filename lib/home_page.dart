import 'package:flutter/material.dart';
import 'package:flutter_osc_client/constants/constants.dart' show AppColors;
import 'package:flutter_osc_client/pages/home_discovery_page.dart';
import 'package:flutter_osc_client/pages/home_news_list_page.dart';
import 'package:flutter_osc_client/pages/home_profile_page.dart';
import 'package:flutter_osc_client/pages/home_tweet_page.dart';
import 'package:flutter_osc_client/widget/my_drawer.dart';
import 'package:flutter_osc_client/widget/navigation_icon_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ["资讯", "动弹", "发现", "我的"];
  final _drawerTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];
  final _drawerIcons = [Icons.send, Icons.home, Icons.error, Icons.settings];
  final _drawerHeadImg = 'assets/images/cover_img.jpg';

  List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

  //TODO 在initState()方法中写初始化，必须重新运行Run 不能用热重载
  @override
  void initState() {
    super.initState();

    //中间布局
    _pages = [
      //资讯页面
      HomeNewsListPage(),
      //动弹页面
      HomeTweetPage(),
      //发现页面
      HomeDiscoveryPage(),
      //我的页面
      HomeProfilePage(),
    ];

    _pageController = PageController(initialPage: _currentIndex);

    //底部
    _navigationIconViews = [
      NavigationIconView(
          title: _appBarTitle[0],
          iconPath: 'assets/images/ic_nav_news_normal.png',
          activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: _appBarTitle[1],
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: _appBarTitle[2],
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: _appBarTitle[3],
          iconPath: 'assets/images/ic_nav_my_normal.png',
          activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //SafeArea 可以适配刘海屏等异形屏
    return Scaffold(
      appBar: AppBar(
        //阴影
        elevation: 0.0,
        title: Text(
          _appBarTitle[_currentIndex],
          style: TextStyle(color: Color(AppColors.APP_BAR)),
        ),
        iconTheme: IconThemeData(color: Color(AppColors.APP_BAR)),
      ),
      body: PageView.builder(
        //禁止滑动
        physics: NeverScrollableScrollPhysics(),

        itemBuilder: (BuildContext context, int index) {
          return _pages[_currentIndex];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navigationIconViews.map((view) => view.item).toList(),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 1), curve: Curves.ease);
        },
      ),
      drawer: MyDrawer(
        headImgPath: _drawerHeadImg,
        menuIcons: _drawerIcons,
        menuTitles: _drawerTitles,
      ),
    );
  }
}
