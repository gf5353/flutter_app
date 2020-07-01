import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fai_webview/flutter_fai_webview.dart';

class HtmlWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHtmlView();
  }
}

class MyHtmlView extends State<HtmlWidget> {

  callBack(int code, String msg, content) {
    //加载页面完成后 对页面重新测量的回调
    if (code == 201) {
      //更新高度
//      webViewHeight = content;
      print("webViewHeight " + content.toString());
    } else {
      //其他回调
    }
    setState(() {
//      message = "回调：code[" + code.toString() + "]; msg[" + msg.toString() + "]";
    });
  }

  Widget _buildSuggestions() {
    return FaiWebViewWidget(
      //webview 加载网页链接
      url: "http://gufei.online",
      //webview 加载信息回调
      callback: callBack,
      //输出日志
      isLog: true,
    );
//    return WebView(
//      initialUrl: 'http://gufei.online',
//      javascriptMode: JavascriptMode.unrestricted,
//      onWebViewCreated: (WebViewController webViewController) {
////        _controller.complete(webViewController);
//      },
//      // ignore: prefer_collection_literals
//    );
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
