import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageTwo extends StatefulWidget {

  PageTwo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  PageTwoState createState() => new PageTwoState();
}

class PageTwoState extends State<PageTwo> {

  Future<File> _imageFile;

  @override
  Widget build(BuildContext context){
    var drawer = new Drawer(
      child: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new DrawerHeader(
            decoration: new BoxDecoration(
            color: Colors.orange,
            border: new Border.all(
                    color: Colors.orangeAccent,
                    width: 3.0,
                  ),
          ),
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: <Widget>[
                  new IconButton (
                  icon: new Icon(Icons.face, color: Colors.brown),
                  iconSize: 80.0,
                  onPressed: null //(){Navigator.of(context).pop();},
                ),
                new Text("I am You!")
                ],
              )

            ),
          ),
          const ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: true,
            onTap: null
          ),
          const ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            //enabled: false,
            onTap: null
          ),
          const Divider(),
          new ListTile(
            leading: const Icon(Icons.power_settings_new),
            title: const Text('Logout'),
            onTap: (){Navigator.popAndPushNamed(context, "/");}
          ),

        ],
      ),



    );

    // var img1 = new Image(
    //   image: new NetworkImage('https://placekitten.com/g/200/305')
    // );
    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.deepOrangeAccent,
        //bottom: ,
      ),
      body: new GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5.0),
              crossAxisSpacing: 2.0,
              crossAxisCount: 1,
              mainAxisSpacing: 2.0,
              children: <Widget>[
                new FutureBuilder<File>(
                    future: _imageFile,
                    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return new Image.file(snapshot.data, fit: BoxFit.fitWidth,);
                      } else {
                        return const Text('You have not yet picked an image.');
                      }
                    }),
                new Container(
                  child: new Image.asset('assets/6.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/5.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/4.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/3.jpg', fit: BoxFit.fitWidth , scale: 0.8),
                ),
                new Container(
                  child: new Image.asset('assets/2.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/1.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/6.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/5.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/4.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
                new Container(
                  child: new Image.asset('assets/3.jpg', fit: BoxFit.fitWidth , scale: 0.8),

                ),
          ],
        ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            setState(() {
              _imageFile = ImagePicker.pickImage();
            });
          },
          tooltip: 'Pick Image',
          child: new Icon(Icons.add_a_photo),
        ),
      // body: new ListView(
      //   padding:  const EdgeInsets.all(10.0) ,
      //   children: <Widget>[
      //     new Text(
      //       "something nutty\n\n\n"  ,
      //        style: new TextStyle(
      //          fontWeight: FontWeight.normal,
      //          fontFamily: "Roboto",
      //          fontSize: 15.0
      //        )),
      //     new Text(
      //          "Butter will save lives\n\n\n"  ,
      //           style: new TextStyle(
      //             fontWeight: FontWeight.normal,
      //
      //             fontSize: 15.0
      //           )),
      //
      //
      //   ],
      // )

    );
  }
}
