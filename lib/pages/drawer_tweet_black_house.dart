import 'package:flutter/material.dart';

class DrawerTweetBlackHousePage extends StatefulWidget {
  @override
  _DrawerTweetBlackHousePageState createState() => _DrawerTweetBlackHousePageState();
}

class _DrawerTweetBlackHousePageState extends State<DrawerTweetBlackHousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "动态小黑屋"
        ),
      ),
    );
  }
}
