import 'package:flutter/material.dart';
import 'package:flutter_osc_client/common/event_bus.dart';
import 'package:flutter_osc_client/constants/constants.dart';
import 'package:flutter_osc_client/utils/data_utils.dart';

class DrawerSettingPage extends StatefulWidget {
  @override
  _DrawerSettingPageState createState() => _DrawerSettingPageState();
}

class _DrawerSettingPageState extends State<DrawerSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //显示左侧的小箭头 默认true 显示
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Color(AppColors.APP_BAR),
        ),
        title: Text(
          "设置",
          style: TextStyle(
            color: Color(AppColors.APP_BAR),
          ),
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            DataUtils.cleanLoginInfo().then((_){
              eventBus.fire(LogoutEvent());
              Navigator.of(context).pop("dissmiss_drawer");
            });
          },
          child: Text(
            "退出登录",
            style: TextStyle(fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}
