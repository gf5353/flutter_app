import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device/device.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PackageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PackageView();
  }
}

class PackageView extends State<PackageWidget> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Device.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<String> getElectricity() async {
    String electricity;
    try {
      electricity = await Device.electricity;
      electricity="当前电量:"+electricity;
    } catch (e) {
      electricity = "获取失败";
    }
    return electricity;
  }

  Widget _buildSuggestions() {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('Running on: $_platformVersion\n'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('获取当前电量'),
          onPressed: () {
            getElectricity().then((value) => {
              Fluttertoast.showToast(msg: value)
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(obj['title']),
        ),
        body: Center(
          child: _buildSuggestions(),
        ));
  }
}
