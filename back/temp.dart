// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_launcher/video_launcher.dart';
//
// import './homePage.dart';
import './tabs.dart';

void main() => runApp(new ButterApp());

class ButterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
        return new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder> {
        "/Tabs": (BuildContext context) => new MyTabs(title: 'Butter Blues'),
        // "/PageTwo": (BuildContext context) => new PageTwo(title: 'Butter Me'),
        // "/Awesome": (BuildContext context) => new AwesomeButton(title: 'Blue Moon')
      }
    );
  }
}

//
//
// typedef void OnError(Exception exception);
//
// const videoUrl = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
//
//
// class AwesomeButton extends StatefulWidget {
//   AwesomeButton({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   AwesomeButtonState createState() => new AwesomeButtonState();
// }
//
// class AwesomeButtonState extends State<AwesomeButton> {
// Future<Null> _launched;
// String localVideoPath;
// String localAssetPath;
//
// _buildButton(String label, VoidCallback onPressed) => new Padding(
//     padding: new EdgeInsets.all(12.0),
//     child: new RaisedButton(
//       onPressed: onPressed,
//       child: new Text(label),
//     ));
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   int counter = 1;
//   List<String> strings = ["Flutter", "Is", "Awesome"];
//   String displayedString = "Flutter";
//
//   void onPressed() {
//     setState(() {
//       displayedString = strings[counter];
//       counter = counter < 2 ? counter + 1 : 0;
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text(widget.title), backgroundColor: Colors.greenAccent),
//       body: new Container(
//         child: new Center(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(displayedString, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
//               new Padding(padding: new EdgeInsets.all(10.0)),
//               new RaisedButton(
//                 child: new Text("Press me!", style: new TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: onPressed
//               ),
//               new IconButton(
//                 icon: new Icon(Icons.arrow_right) ,
//               iconSize: 72.0,
//               color: Colors.blueAccent,
//                  onPressed: (){Navigator.of(context).pushNamed("/");},
//                  ),
//               new Text('Forward'),
//               _buildButton('Play online', _launch),
//               _buildButton(
//                   'Download', localVideoPath != null ? null : _loadVideo),
//               _buildButton(
//                   'Play local', localVideoPath != null ? _launchLocal : null),
//               _buildButton('Play video asset', _loadOrLaunchLocalAsset),
//             ]
//           )
//         )
//       )
//     );
//   }
//
//   void _launch() => setState(() => _launched = _launchVideo(videoUrl));
//
//   void _launchLocal() =>
//       setState(() => _launched = _launchVideo(localVideoPath, isLocal: true));
//
//   void _loadOrLaunchLocalAsset() =>
//       localAssetPath != null ? _launchLocalAsset() : copyLocalAsset();
//
//   Future copyLocalAsset() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final file = new File("${dir.path}/video_asset.mp4");
//     final videoData = await rootBundle.load("assets/video.mp4");
//     final bytes = videoData.buffer.asUint8List();
//     await file.writeAsBytes(bytes, flush: true);
//     setState(() {
//       localAssetPath = file.path;
//       _launchLocalAsset();
//     });
//   }
//
//   void _launchLocalAsset() =>
//       _launched = _launchVideo(localAssetPath, isLocal: true);
//
//   Widget _launchStatus(BuildContext context, AsyncSnapshot<Null> snapshot) {
//     String info;
//     if (snapshot.hasError) {
//       return new Text('Error: ${snapshot.error}');
//     } else {
//       info = localVideoPath != null ? localVideoPath : '';
//     }
//     return new Padding(
//         padding: new EdgeInsets.only(top: 20.0), child: new Text(info));
//   }
//
//   Future<Null> _launchVideo(String url, {bool isLocal: false}) async {
//     if (await canLaunchVideo(url, isLocal: isLocal)) {
//       await launchVideo(url, isLocal: isLocal);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   Future _loadVideo() async {
//     final bytes = await _loadFileBytes(videoUrl,
//         onError: (Exception exception) =>
//             print('_MyHomePageState._loadVideo => exception $exception'));
//
//     final dir = await getApplicationDocumentsDirectory();
//     final file = new File('${dir.path}/video.mp4');
//
//     await file.writeAsBytes(bytes);
//     if (await file.exists())
//       setState(() {
//         localVideoPath = file.path;
//       });
//   }
//
//   Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
//     Uint8List bytes;
//     try {
//       bytes = await readBytes(url);
//     } on ClientException {
//       rethrow;
//     }
//     return bytes;
//   }
//
// }
//
//
//


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.deepPurpleAccent,
        flexibleSpace: null,
        leading: new IconButton(
          icon: new Icon(Icons.code),
          tooltip: 'This does nothing',
          onPressed: null,
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              new IconButton (
              icon: new Icon(Icons.person, color: Colors.lightBlue),
              iconSize: 70.0 ,
              onPressed: null ,

            ),
            new Text(
              "You can login to butter \n with the below button\n\n\n"  ,
               style: new TextStyle(
                 fontWeight: FontWeight.normal,
                 fontFamily: "Roboto",
                 fontSize: 15.0
               )

            ),
            new FlatButton(
              onPressed: (){Navigator.of(context).pushNamed("/Tabs");},
              color: Colors.deepPurple,
              textColor: Colors.white ,
              splashColor: Colors.green,
              child: const Text('Login'),
            ),
            ],
          )
        )
      ),
    );
  }
}
