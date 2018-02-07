import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medcorder_audio/medcorder_audio.dart';



class Recordtab extends StatefulWidget {
  Recordtab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RecordtabState createState() => new _RecordtabState();
}

class _RecordtabState extends State<Recordtab> {

  MedcorderAudio audioModule = new MedcorderAudio();
  bool canRecord = false;
  double recordPower = 0.0;
  double recordPosition = 0.0;
  bool isRecord = false;
  bool isPlay = false;
  double playPosition = 0.0;
  String file = "";

  @override
  initState() {
    super.initState();
    audioModule.setCallBack((dynamic data){
      _onEvent(data);
    });
    _initSettings();
  }

  Future _initSettings() async{
    final String result = await audioModule.checkMicrophonePermissions();
    if (result == 'OK'){
      await audioModule.setAudioSettings();
      setState((){
        canRecord = true;
      });
    }
    return;
  }

  Future _startRecord() async {
    try {
      DateTime time = new DateTime.now();
      setState((){
        file = time.millisecondsSinceEpoch.toString();
      });
      final String result = await audioModule.startRecord(file);
      setState((){
        isRecord = true;
      });
      print('startRecord: ' + result);
    } catch (e) {
      file = "";
      print('startRecord: fail');
    }
  }

  Future _stopRecord() async {
    try {
      final String result = await audioModule.stopRecord();
      print('stopRecord: ' + result);
      setState((){
        isRecord = false;
      });
    } catch (e) {
      print('stopRecord: fail');
      setState((){
        isRecord = false;
      });
    }
  }

  Future _StartStopPlay() async{
    if(isPlay){
      await audioModule.stopPlay();
    }else{
      await audioModule.startPlay({
        "file": file,
        "position": 0.0,
      });
    }
  }



  void _onEvent(dynamic event){
    if(event['code'] == 'recording'){
      double power = event['peakPowerForChannel'];
      setState((){
        recordPower = (60.0 - power.abs().floor()).abs();
        recordPosition = event['currentTime'];
      });
    }
    if(event['code'] == 'playing'){
      String url = event['url'];
      setState((){
        playPosition = event['currentTime'];
        isPlay = true;
      });
    }
    if(event['code'] == 'audioPlayerDidFinishPlaying') {
      setState((){
        playPosition = 0.0;
        isPlay = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
          child: canRecord ? new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(widget.title, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              new InkWell(
                child: new Container(
                  alignment: FractionalOffset.center,
                  child: new Text(isRecord ? 'Stop':'Record'),
                  height: 40.0,
                  width: 200.0,
                  color: Colors.blue,
                ),
                onTap: (){
                  if (isRecord){
                    _stopRecord();
                  }else{
                    _startRecord();
                  }
                },
              ),
              new Text('recording: ' + recordPosition.toString()),
              new Text('power: ' + recordPower.toString()),
              new InkWell(
                child: new Container(
                  margin: new EdgeInsets.only(top: 40.0),
                  alignment: FractionalOffset.center,
                  child: new Text(isPlay ? 'Stop':'Play'),
                  height: 40.0,
                  width: 200.0,
                  color: Colors.blue,
                ),
                onTap: (){
                  if (!isRecord && file.length > 0){
                    _StartStopPlay();
                  }
                },
              ),
              new Text('playing: ' + playPosition.toString()),
            ],
          ): new Text('No permissions for record'),
    );
  }
}
