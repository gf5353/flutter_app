import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeWidget extends StatefulWidget {
  @override
  HomeView createState() {
    return HomeView();
  }
}

class HomeView extends State<HomeWidget> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            Fluttertoast.showToast(msg: "再返回退出");

            return false;
          }
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter 测试'),
            ),
            body: Center(
              child: _buildSuggestions(),
            )));

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter 测试'),
        ),
        body: Center(
          child: _buildSuggestions(),
        ));
  }

  Widget _buildSuggestions() {
    List<String> list = ['Widgets使用示例', '对话框使用示例', 'http使用示例', 'html使用示例','packages及平台特定代码实现'];

    return ListView.builder(itemBuilder: (context, i) {
      return i < list.length
          ? ListTile(
              title: Text(list[i]),
              onTap: () {
                switch (i) {
                  case 0:
                    Navigator.pushNamed(context, '/widgets',
                        arguments: {'title': list[i]});
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/dialog',
                        arguments: {'title': list[i]});
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/http',
                        arguments: {'title': list[i]});
                    break;
                  case 3:
                    Navigator.pushNamed(context, '/html',
                        arguments: {'title': list[i]});
                    break;
                  case 4:
                    Navigator.pushNamed(context, '/packages',
                        arguments: {'title': list[i]});
                    break;
                  default:
                    Fluttertoast.showToast(msg: list[i] + '被点击');
                    break;
                }
              },
            )
          : null;
    });
  }
}
