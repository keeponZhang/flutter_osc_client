import 'package:flutter/material.dart';

class DrawerSettingPage extends StatefulWidget {
  @override
  _DrawerSettingPageState createState() => _DrawerSettingPageState();
}

class _DrawerSettingPageState extends State<DrawerSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //显示左侧的小箭头 默认true 显示
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ) ,
        title: Text(
            "设置"
        ),
      ),
    );
  }
}
