import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_osc_client/constants/constants.dart'
    show AppColors, AppUrls;
import 'package:flutter_osc_client/models/user_info.dart';
import 'package:flutter_osc_client/utils/data_utils.dart';
import 'package:flutter_osc_client/utils/net_utils.dart';
import 'package:flutter/cupertino.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  List<String> _tabTitles = ['@我', '评论', '私信'];
  int curPage = 1;
  List messageList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color(AppColors.APP_BAR)),
          title: Text(
            "消息中心",
            style: TextStyle(color: Color(AppColors.APP_BAR)),
          ),
          bottom: TabBar(
            tabs: _tabTitles
                .map((title) => Tab(
                      text: title,
                    ))
                .toList(),
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.deepOrange,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('暂无内容'),
            ),
            Center(
              child: Text('暂无内容'),
            ),
            _buildMessageList(),
          ],
        ),
      ),
      length: _tabTitles.length,
    );
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    _getMessageList();
    return null;
  }

  _buildMessageList() {
    if (messageList == null) {
      _getMessageList();
      //获取私信
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return RefreshIndicator(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Image.network(messageList[index]['portrait']),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${messageList[index]['sendername']}',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${messageList[index]['pubDate']}',
                              style: TextStyle(
                                  fontSize: 12.0, color: Color(0xffaaaaaa)),
                            ),
                          ],
                        ),
                        Text(
                          '${messageList[index]['content']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: messageList.length),
      onRefresh: _pullToRefresh
    );
  }



  void _getMessageList() {
    DataUtils.isLogin().then((isLogin) {
      if (isLogin) {
        DataUtils.getAccessToken().then((accessToken) {
          print('accessToken: $accessToken');
          //拼装请求
          Map<String, dynamic> params = Map<String, dynamic>();
          params['dataType'] = 'json';
          params['page'] = curPage;
          params['pageSize'] = 10;
          params['access_token'] = accessToken;
          NetUtils.get(AppUrls.MESSAGE_LIST, params).then((data) {
            print('MY_INFORMATION: $data');
            if (data != null && data.isNotEmpty) {
              Map<String, dynamic> map = json.decode(data);
              var _messageList = map['messageList'];
              if (mounted) {
                setState(() {
                  messageList = _messageList;
                });
              }
            }
          });
        });
      }
    });
  }
}
