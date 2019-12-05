import 'package:flutter/material.dart';
import 'package:flutter_osc_client/pages/drawer_about.dart';
import 'package:flutter_osc_client/pages/drawer_publish_tweet.dart';
import 'package:flutter_osc_client/pages/drawer_settings.dart';
import 'package:flutter_osc_client/pages/drawer_tweet_black_house.dart';

class MyDrawer extends StatelessWidget {
  final String headImgPath;
  final List menuTitles;
  final List menuIcons;

  MyDrawer(
      {Key key,
      @required this.headImgPath,
      @required this.menuIcons,
      @required this.menuTitles})

      ///assert 在debug会执行，在release不会执行，便于在调式的时候执行
      : assert(headImgPath != null),
        assert(menuIcons != null),
        assert(menuTitles != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        //解决状态栏问题
        padding: const EdgeInsets.all(0.0),
        itemCount: menuTitles.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Image.asset(
              headImgPath,
              fit: BoxFit.cover,
            );
          }
          index -= 1;
//          return Container(
//            color: Colors.white,
//            height: 50.0,
//            padding: const EdgeInsets.only(left: 16.0),
//            child: Row(
//              children: <Widget>[
//                Icon(menuIcons[index]),
//                SizedBox(width: 10.0,),
//                Text(
//                  menuTitles[index],
//                ),
//                Icon(Icons.arrow_forward_ios),
//              ],
//
//
//            ),
//          );
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(
              menuTitles[index],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              switch (index) {
                case 0:
                  _navPush(context, DrawerPublishTweetPage());
                  //
                  break;
                case 1:
                  _navPush(context, DrawerTweetBlackHousePage());
                  break;
                case 2:
                  _navPush(context, DrawerAboutPage());
                  break;
                case 3:
                  _navPush(context, DrawerSettingPage());
                  break;
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          if (index == 0) {
            return Divider(
              height: 0.0,
            );
          } else {
            return Divider(
              height: 1.0,
            );
          }
        },
      ),
    );
  }

  Future _navPush(BuildContext context, Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }
}
