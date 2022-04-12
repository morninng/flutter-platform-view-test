import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextView extends StatefulWidget {
  const TextView(this.text) : super();

  final String text;

  // final Function(TextViewController) onTextViewCreated;



  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {

  // TextViewController _controller;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      debugPrint('--- andriod view added');
      return AndroidView(
        viewType: 'plugins.team.itome/textview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) async{
    debugPrint("   ----  _TextViewState _onPlatformViewCreated ${id}");
    final _controller = TextViewController(id);
    _controller.setText("上位から設定された文字");
  }
}

class TextViewController {
  TextViewController(
    int id,
  ) : _channel = MethodChannel('plugins.team.itome/textview_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    debugPrint("---- TextViewController setText() ${text}");
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }
}