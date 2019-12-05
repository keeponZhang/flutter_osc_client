import 'package:flutter/material.dart';
import 'package:flutter_osc_client/widget/navigation_icon_view.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _appBarTitle = ["资讯", "动弹", "发现", "我的"];
  List<NavigationIconView> _NavigationIconViews;

  @override
  void initState() {
    super.initState();
    _NavigationIconViews=[
      NavigationIconView(
          title: '资讯',
          iconPath: 'assets/images/ic_nav_news_normal.png',
          activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: '动弹',
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: '发现',
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: '我的',
          iconPath: 'assets/images/ic_nav_my_normal.png',
          activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO 标题
        title: Text("开元中国"),
      ),
      body: Container(),
//      bottomNavigationBar: BottomNavigationBar(
//        items: NavigationIconView(),
//      ),
    );
  }
}
