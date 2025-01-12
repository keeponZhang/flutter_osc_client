import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:vibration/vibration.dart';

class ShakePage extends StatefulWidget {
  @override
  _ShakePageState createState() => _ShakePageState();
}

class _ShakePageState extends State<ShakePage> {
  bool isShaked = false;
  int _curentIndex = 0;
  StreamSubscription _streamSubscription;
  static const int SHAKE_TIMEOUT = 500;
  static const double SHAKE_THRESHOLD = 3.25;
  var _lastTime = 0;

  @override
  void initState() {
    super.initState();
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      var now = DateTime.now().millisecondsSinceEpoch;
      if ((now - _lastTime) > SHAKE_TIMEOUT) {
        var x = event.x;
        var y = event.y;
        var z = event.z;
        double acce = sqrt(x * x + y * y + z * z) - 9.8; //g
        if (acce > SHAKE_THRESHOLD) {
          print('摇一摇');
          //手机晃动了
          Vibration.vibrate();
          _lastTime = now;
          if (!mounted) return;
          setState(() {
            isShaked = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('摇一摇'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/shake.png',
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(isShaked?'活动已结束！':'摇一摇获取礼品'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: ('礼品')),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: ('资讯'))
        ],
        currentIndex: _curentIndex,
        onTap: (index) {
          if (!mounted) return;
          setState(() {
            _curentIndex = index;
            isShaked = false;
          });
        },
      ),
    );
  }
}
