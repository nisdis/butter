import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_launcher/video_launcher.dart';


typedef void OnError(Exception exception);

const videoUrl = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";


class Videotab extends StatefulWidget {
  Videotab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  VideotabState createState() => new VideotabState();
}

class VideotabState extends State<Videotab> {
Future<Null> _launched;
String localVideoPath;
String localAssetPath;

_buildButton(String label, VoidCallback onPressed) => new Padding(
    padding: new EdgeInsets.all(12.0),
    child: new RaisedButton(
      onPressed: onPressed,
      child: new Text(label),
    ));

  _buildplay(VoidCallback onPressed) => new IconButton(
    padding: new EdgeInsets.all(12.0),
    icon: new Icon(Icons.play_circle_filled),
    iconSize: 102.0,
    color: Colors.blueAccent,
    onPressed: onPressed,
  );

  @override
  void initState() {
    super.initState();
  }

  int counter = 1;
  List<String> strings = ["Flutter", "Is", "Awesome"];
  String displayedString = "Flutter";

  void onPressed() {
    setState(() {
      displayedString = strings[counter];
      counter = counter < 2 ? counter + 1 : 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return  new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(widget.title, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              _buildplay( _loadOrLaunchLocalAsset)
            ]
          )
        )
    );
  }

  void _launch() => setState(() => _launched = _launchVideo(videoUrl));

  void _launchLocal() =>
      setState(() => _launched = _launchVideo(localVideoPath, isLocal: true));

  void _loadOrLaunchLocalAsset() =>
      localAssetPath != null ? _launchLocalAsset() : copyLocalAsset();

  Future copyLocalAsset() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/video_asset.mp4");
    final videoData = await rootBundle.load("assets/video.mp4");
    final bytes = videoData.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      localAssetPath = file.path;
      _launchLocalAsset();
    });
  }

  void _launchLocalAsset() =>
      _launched = _launchVideo(localAssetPath, isLocal: true);

  Widget _launchStatus(BuildContext context, AsyncSnapshot<Null> snapshot) {
    String info;
    if (snapshot.hasError) {
      return new Text('Error: ${snapshot.error}');
    } else {
      info = localVideoPath != null ? localVideoPath : '';
    }
    return new Padding(
        padding: new EdgeInsets.only(top: 20.0), child: new Text(info));
  }

  Future<Null> _launchVideo(String url, {bool isLocal: false}) async {
    if (await canLaunchVideo(url, isLocal: isLocal)) {
      await launchVideo(url, isLocal: isLocal);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _loadVideo() async {
    final bytes = await _loadFileBytes(videoUrl,
        onError: (Exception exception) =>
            print('_MyHomePageState._loadVideo => exception $exception'));

    final dir = await getApplicationDocumentsDirectory();
    final file = new File('${dir.path}/video.mp4');

    await file.writeAsBytes(bytes);
    if (await file.exists())
      setState(() {
        localVideoPath = file.path;
      });
  }

  Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
    Uint8List bytes;
    try {
      bytes = await readBytes(url);
    } on ClientException {
      rethrow;
    }
    return bytes;
  }

}
