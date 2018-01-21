import 'package:flutter/material.dart';


void main() => runApp(new MaterialApp(
  home: new HomePage(),
  routes: <String, WidgetBuilder> {
    "/PageTwo": (BuildContext context) => new PageTwo()
  }
));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.deepOrangeAccent,
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
              onPressed: (){Navigator.of(context).pushNamed("/PageTwo");},
              color: Colors.green,
              textColor: Colors.white ,
              splashColor: Colors.greenAccent,
              child: const Text('Login'),
            ),
            ],
          )
        )
      ),
    );
  }
}


class PageTwo extends StatelessWidget {
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
    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text("Butter App"),
        backgroundColor: Colors.deepOrangeAccent,
        //bottom: ,
      ),
      body: new GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20.0),
  crossAxisSpacing: 10.0,
  crossAxisCount: 2,
  children: <Widget>[
    const Text('He\'d have you all unravel at the'),
    const Text('Heed not the rabble'),
    const Text('Sound of screams but the'),
    const Text('Who scream'),
    const Text('Revolution is coming...'),
    const Text('Revolution, they...'),
  ],
)
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
