
import 'package:flutter/material.dart';
import 'HomeTabs/Tab1.dart' as first;
import 'HomeTabs/Tab2.dart' as second;
import 'HomeTabs/Tab3.dart' as third;


class MyTabs extends StatefulWidget {

  MyTabs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = new Drawer(
      child: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new DrawerHeader(
            decoration: new BoxDecoration(
            color: Colors.lightBlueAccent,
            border: new Border.all(
                    color: Colors.blue,
                    width: 1.0,
                  ),
          ),
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: <Widget>[
                  new IconButton (
                  icon: new Icon(Icons.face, color: Colors.black54),
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

    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.blue,
        // bottom: new TabBar(
        //   controller: controller,
        //   tabs: <Tab>[
        //     new Tab(icon: new Icon(Icons.arrow_forward)),
        //     new Tab(icon: new Icon(Icons.arrow_downward)),
        //     new Tab(icon: new Icon(Icons.arrow_back)),
        //   ]
        // )
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepPurpleAccent,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(icon: new Icon(Icons.movie)),
            new Tab(icon: new Icon(Icons.mic)),
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.Imagetab(title: 'Image Picker'),
          new second.Videotab(title: 'Video Player'),
          new third.Recordtab(title: 'Audio Rec')
        ]
      )
    );
  }
}
