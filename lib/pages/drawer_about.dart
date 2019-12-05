import 'package:flutter/material.dart';

class DrawerAboutPage extends StatefulWidget {
  @override
  _DrawerAboutPageState createState() => _DrawerAboutPageState();
}

class _DrawerAboutPageState extends State<DrawerAboutPage> {
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
