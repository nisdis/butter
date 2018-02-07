

import 'package:flutter/material.dart';

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

      }
    );
  }
}

const String words = "A simple app to showcase \n 3 flutter plugins:\n\n 'image_picker' \n 'video_launcher' \n 'medcorder_audio'\n";


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
              new Text(
                "Butter",
                textAlign: TextAlign.center ,
                 style: new TextStyle(
                   fontWeight: FontWeight.bold,
                   fontFamily: "Lato",
                   fontSize: 28.0,

                 )

              ),
              new Text(
                words,
                textAlign: TextAlign.center ,
                 style: new TextStyle(
                   fontWeight: FontWeight.normal,
                   fontFamily: "Lato",
                   fontSize: 18.0,

                 )

              ),
            new Icon(
              Icons.person,
              color: Colors.lightBlue,
              size: 75.0 ,
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
