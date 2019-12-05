import 'package:flutter/material.dart';
import 'package:flutter_osc_client/constants/constants.dart' show AppColors;
import 'package:flutter_osc_client/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去掉右上角Debug标签
      debugShowCheckedModeBanner: false,
      title: '开源中国',
      theme: ThemeData(
        primaryColor: Color(AppColors.APP_THEME),
      ),
      home: HomePage(),
    );
  }
}
