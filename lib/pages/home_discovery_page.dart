
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osc_client/pages/shake_page.dart';

import 'common_web_page.dart';

class HomeDiscoveryPage extends StatefulWidget {
  @override
  _HomeDiscoveryPageState createState() => _HomeDiscoveryPageState();
}

class _HomeDiscoveryPageState extends State<HomeDiscoveryPage> {
  List<Map<String, IconData>> blocks = [
    {
      '开源众包': Icons.pageview,
      '开源软件': Icons.speaker_notes_off,
      '码云推荐': Icons.screen_share,
      '代码片段': Icons.assignment,
    },
    {
      '扫一扫': Icons.camera_alt,
      '摇一摇': Icons.camera,
    },
    {
      '码云封面人物': Icons.person,
      '线下活动': Icons.android,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (context, blockIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Color(0xffaaaaaa),
                ),
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0xffaaaaaa),
                ),
              ),
            ),
            child: ListView.separated(
                //滑动冲突
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, mapIndex) {
                  return InkWell(
                    onTap: () {
                      _handleItemClick(
                          blocks[blockIndex].keys.elementAt(mapIndex));
                    },
                    child: Container(
                      height: 60.0,
                      child: ListTile(
                        leading:
                            Icon(blocks[blockIndex].values.elementAt(mapIndex)),
                        title:
                            Text(blocks[blockIndex].keys.elementAt(mapIndex)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, mapIndex) {
                  return Divider();
                },
                itemCount: blocks[blockIndex].length),
          );
        });
  }

  void _handleItemClick(String title) {
    switch (title) {
      case '开源众包':
        _navToWebPage(title, 'https://zb.oschina.net/');
        break;
      case '扫一扫':
        scan();
        break;
      case '摇一摇':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ShakePage()));
        break;
    }
  }

  void _navToWebPage(String title, String url) {
    if (title != null && url != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CommonWebPage(
                title: title,
                url: url,
              )));
    }
  }
}

Future scan() async {
  // String barcode =  await BarcodeScanner.scan();
  // print('barcode: $barcode');
}
