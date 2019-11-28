import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class SecondView extends StatefulWidget {
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Container(
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Enter your username'),
        ),
      ),
    );
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary = context.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
//    print(pngBytes);
    print('thi is dir $directory');
    File imgFile = new File('$directory/history.png');
    imgFile.writeAsBytes(pngBytes);
  }
}
