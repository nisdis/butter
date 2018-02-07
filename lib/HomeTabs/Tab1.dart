import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagetab extends StatefulWidget {

  Imagetab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ImagetabState createState() => new ImagetabState();
}

class ImagetabState extends State<Imagetab> {

  Future<File> _imageFile;
  var _imgTmp;

  @override
  Widget build(BuildContext context){

    return new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new Text(widget.title, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                new FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _imageFile = ImagePicker.pickImage();
                          });
                        },
                        tooltip: 'Pick Image',
                        child: new Icon(Icons.add_a_photo),
                      ),
                new FutureBuilder<File>(
                    future: _imageFile,
                    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {

                      if (snapshot.connectionState == ConnectionState.done) {
                        _imgTmp = new Image.file(snapshot.data, fit: BoxFit.contain,);
                        return new Container(
                            child: _imgTmp,
                            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                            //color: const Color(0xFF00FF00),
                            width: 300.0,
                            height: 300.0,
                        );



                        // new Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         mainAxisSize: MainAxisSize.min ,
                        //         children: <Widget>[
                        //            new Image.file(snapshot.data, fit: BoxFit.contain,)
                        //         ],
                        //   );

                      } else {

                          return new Image.asset('assets/6.jpg', fit: BoxFit.fitWidth , scale: 0.8);

                      }
                    }),

                    ],
                )

    );
  }
}
