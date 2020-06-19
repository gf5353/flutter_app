import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

class HttpWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpView();
  }
}

class HttpView extends State<HttpWidget> {
  Dio dio = Dio();

  Future<String> doGet() async {
    Response rsp;
    rsp = await dio.get(
        "http://api.map.baidu.com/telematics/v3/weather?location=%E5%98%89%E5%85%B4&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ");
    print(rsp.data.toString());

    return rsp.data.toString();
  }

  Widget _buildSuggestions() {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('普通get请求'),
          onPressed: () {
            doGet().then((data) {
              Fluttertoast.showToast(msg: data);
            }).catchError((error) {
              Fluttertoast.showToast(msg: '请求异常'+error.toString());
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(obj['title']),
        ),
        body: Center(
          child: _buildSuggestions(),
        ));
  }
}
