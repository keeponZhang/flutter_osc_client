import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_osc_client/constants/constants.dart'
    show AppColors, AppUrls;
import 'package:flutter_osc_client/models/user_info.dart';
import 'package:flutter_osc_client/utils/data_utils.dart';
import 'package:flutter_osc_client/utils/net_utils.dart';
import 'package:flutter/cupertino.dart';

class ProfileDetailPage extends StatefulWidget {
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
    );
  }
}
