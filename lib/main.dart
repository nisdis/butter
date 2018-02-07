

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

    TextStyle bold24Roboto = new TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.w900,

      fontFamily: "Lato",
    );

    _handleTap () {
      print('butter was tapped');
      Navigator.of(context).pushNamed("/Tabs");
    }

    var container = new Container( // grey box
        child: new Center(
          child: new GestureDetector(
          onTap: _handleTap,
          child: new Container( // red circle
            child: new Text(
              "Butter \n ",
              style: bold24Roboto,
              textAlign: TextAlign.center,
            ),
            foregroundDecoration: new BoxDecoration(
            ),
            decoration: new BoxDecoration(
              color: Colors.yellow[400],
              borderRadius: new BorderRadius.all(
                const Radius.circular(18.0),
              ),
           boxShadow: <BoxShadow>[
                      new BoxShadow (
                        color: const Color(0xcc000000),
                        offset: new Offset(0.0, 2.0),
                        blurRadius: 4.0,
                      ),
                      new BoxShadow (
                        color: const Color(0x80000000),
                        offset: new Offset(0.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
              shape: BoxShape.rectangle,
            ),
            padding: new EdgeInsets.all(16.0),
            width: 180.0,
            height: 70.0,
          ),
          ),
        ),
        width: 520.0,
        height: 180.0,
        //color: Colors.grey[300],
      );
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
              // new Text(
              //   "Butter",
              //   textAlign: TextAlign.center ,
              //    style: new TextStyle(
              //      fontWeight: FontWeight.bold,
              //      fontFamily: "Lato",
              //      fontSize: 28.0,
              //
              //    )
              //
              // ),
              container,
              new Text(
                words,
                textAlign: TextAlign.center ,
                 style: new TextStyle(
                   fontWeight: FontWeight.normal,
                   fontFamily: "Lato",
                   fontSize: 18.0,

                 )

              ),
            // new Icon(
            //   Icons.person,
            //   color: Colors.lightBlue,
            //   size: 75.0 ,
            // ),
            //
            // new FlatButton(
            //   onPressed: (){Navigator.of(context).pushNamed("/Tabs");},
            //   color: Colors.deepPurple,
            //   textColor: Colors.white ,
            //   splashColor: Colors.green,
            //   child: const Text('Login'),
            // ),
            ],
          )
        )
      ),
    );
  }
}
