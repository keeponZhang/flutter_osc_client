import 'package:flutter/material.dart';

class HomeProfilePage extends StatefulWidget {
  @override
  _HomeProfilePageState createState() => _HomeProfilePageState();
}

class _HomeProfilePageState extends State<HomeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
    );
  }
}
