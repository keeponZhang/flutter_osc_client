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
        title: Text(
            "设置"
        ),
      ),
    );
  }
}
