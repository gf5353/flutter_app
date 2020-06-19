import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyWidget extends StatefulWidget {
  @override
  WidgetView createState() {
    return WidgetView();
  }
}

class WidgetView extends State<MyWidget> {
  bool _switchSelected = false; //维护单选开关状态

  Widget _buildSuggestions() {
    return SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('文字组件'),
        RaisedButton(
          child: Text('按钮组件'),
          onPressed: () {},
        ),
        TextField(),
        Image(image: AssetImage("images/156163503590827449.jpg"), width: 100.0),
        Image(image: AssetImage("images/156163503590827449.jpg"), width: 100.0),
        Image(image: AssetImage("images/156163503590827449.jpg"), width: 100.0),
        Image(image: AssetImage("images/156163503590827449.jpg"), width: 100.0),
        Image(image: AssetImage("images/156163503590827449.jpg"), width: 100.0),

        Image.network(
          "http://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100.0,
        ),
        Switch(
            value: _switchSelected,
            onChanged: (on) {
              setState(() {
                this._switchSelected = on;
              });
            }),
        LinearProgressIndicator(),
        CircularProgressIndicator()
      ],
    ));
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
