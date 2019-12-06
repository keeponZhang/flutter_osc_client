import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_osc_client/common/event_bus.dart';
import 'package:flutter_osc_client/constants/constants.dart'
    show AppColors, AppUrls;
import 'package:flutter_osc_client/pages/login_web_page.dart';
import 'package:flutter_osc_client/pages/profile_detail_page.dart';
import 'package:flutter_osc_client/utils/data_utils.dart';
import 'package:flutter_osc_client/utils/net_utils.dart';

class HomeProfilePage extends StatefulWidget {
  @override
  _HomeProfilePageState createState() => _HomeProfilePageState();
}

class _HomeProfilePageState extends State<HomeProfilePage> {
  //标题
  List menuTitles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];

  //图标
  List menuIcons = [
    Icons.message,
    Icons.print,
    Icons.error,
    Icons.phone,
    Icons.send,
    Icons.people,
    Icons.person,
  ];

  //用MethodChannel 调原生代码

  String userAvatar;
  String userName;

  @override
  void initState() {
    super.initState();
    //尝试显示用户信息
    _showUserInfo();
    //登录成功显示用户信息
    eventBus.on<LoginEvent>().listen((event) {
      _getUserInfo();
    });

    //退出登录清除用户信息
    eventBus.on<LogoutEvent>().listen((event) {
      _showUserInfo();
    });
  }

  _getUserInfo() {
    DataUtils.getAccessToken().then((accessToken) {
      if (accessToken == null) {
        return;
      }

      Map<String, dynamic> params = Map<String, dynamic>();
      params['access_token'] = accessToken;
      params['dataType'] = 'json';
      print('accessToken: $accessToken');

      NetUtils.get(AppUrls.OPENAPI_USER, params).then((data) {
        print('data: $data');
        //data: {"gender":"female","name":"zb1496904104779","location":"北京","id":3528824,
        // "avatar":"https://www.oschina.net/img/portrait.gif","email":"48ad1968-8d9f-4be9-aac9-c7bab325d34e",
        // "url":"https://my.oschina.net/u/3528824"}
        Map<String, dynamic> map = json.decode(data);
        if (mounted != null) {
          setState(() {
            userAvatar = map['avatar'];
            userName = map['name'];
          });
        }
        DataUtils.saveUserInfo(map);
      });
    });
  }

  _showUserInfo() {
    DataUtils.getUserInfo().then((user) {
      if (mounted) {
        setState(() {
          if (user != null) {
            userAvatar = user.avatar;
            userName = user.name;
          } else {
            userAvatar = null;
            userName = null;
          }
        });
      }
    });
  }

  _login() async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginWebPage()));
    if (result != null && result == 'login_success_refresh') {
      //登录成功
      eventBus.fire(LoginEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildHeader();
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(menuTitles[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
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
        itemCount: menuTitles.length + 1);
  }

  //设置头像
  Container buildHeader() {
    return Container(
      height: 200.0,
      color: Color(AppColors.APP_THEME),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //头像
            GestureDetector(
              child: userAvatar != null
                  ? Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.0),
                        image: DecorationImage(
                          image: NetworkImage(userAvatar),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Image.asset(
                      'assets/images/ic_avatar_default.png',
                      width: 60.0,
                      height: 60.0,
                    ),
              onTap: () {
                DataUtils.isLogin().then((isLogin){
                  if(isLogin){
                    //详情
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileDetailPage()));
                  }else{
                    //执行登录
                    _login();
                  }
                });

              },
            ),
            SizedBox(
              height: 10.0,
            ),
            //用户名
            Text(
              userName ??= '点击头像登录',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
