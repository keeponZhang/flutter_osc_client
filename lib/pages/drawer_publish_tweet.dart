import 'package:flutter/material.dart';

class DrawerPublishTweetPage extends StatefulWidget {
  @override
  _DrawerPublishTweetPageState createState() => _DrawerPublishTweetPageState();
}

class _DrawerPublishTweetPageState extends State<DrawerPublishTweetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "发布动态"
        ),
      ),
    );
  }
}
