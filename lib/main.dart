import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static GlobalKey previewContainer = new GlobalKey();
  int _counter = 0;
  String path = "";

  void _incrementCounter() async {
    getLocalPath("$_counter.png").then((onValue) {
      print("executing this methods $onValue");
      setState(() {
        _counter++;
        path = onValue;
      });
    });
  }

  Future<String> getLocalPath(String fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return '$dir/$fileName';
  }

  Future<File> _getLocalFile(String filename) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = new File('$dir/$filename');
    return f;
  }

  @override
  Widget build(BuildContext context) {
    var img = path.contains("${_counter - 1}")
        ? Image.file(File(path))
        : Image.asset("images/info_share.png");
    return RepaintBoundary(
        key: previewContainer,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                new RaisedButton(
                  onPressed: takeScreenShot,
                  child: const Text('Take a Screenshot'),
                ),
                new Center(
                  child: new AspectRatio(
                    aspectRatio: 487 / 451,
                    child: img,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
        ));
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary = context.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
//    print(pngBytes);
    print('thi is dir $directory');
    File imgFile = new File('$directory/$_counter.png');
    imgFile.writeAsBytes(pngBytes);
  }
}
