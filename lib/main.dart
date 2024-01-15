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

// class MyAppV2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   // _HomePageState createState() => _HomePageState();
//   _HomePageStateV2 createState() => _HomePageStateV2();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MaterialApp dialog示例'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SimpleDialog(
//               title: Text('title'),
//               children: <Widget>[
//                 SimpleDialogOption(
//                   child: Text('选择1'),
//                   onPressed: () {
//                     print('选择1');
//                   },
//                 ),
//                 SimpleDialogOption(
//                   child: Text('选择2'),
//                   onPressed: () {
//                     print('选择2');
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _HomePageStateV2 extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MaterialApp dialog示例'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SimpleDialog(
//               title: Text('title'),
//               children: <Widget>[
//                 SimpleDialogOption(
//                   child: Text('选择1'),
//                   onPressed: () {
//                     print('选择1');
//                   },
//                 ),
//                 SimpleDialogOption(
//                   child: Text('选择2'),
//                   onPressed: () {
//                     print('选择2');
//                   },
//                 ),
//               ],
//             ),
//             RaisedButton(
//               child: Text('删除'),
//               onPressed: () {
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text("title"),
//                         content: SingleChildScrollView(
//                           child: ListBody(
//                             children: <Widget>[
//                               Text('是否删除?'),
//                               Text('删除后不可恢复!'),
//                             ],
//                           ),
//                         ),
//                         actions: <Widget>[
//                           FlatButton(
//                             child: Text('确定'),
//                             onPressed: () {
//                               Navigator.of(context).pop(); //取消对话框
//                             },
//                           ),
//                           FlatButton(
//                             child: Text('取消'),
//                             onPressed: () {
//                               Navigator.of(context).pop(); //取消对话框
//                             },
//                           )
//                         ],
//                       );
//                     });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }





