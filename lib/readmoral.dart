import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'platform/platform.dart';
import 'platform/myplatform.dart';



class Readmoral extends StatefulWidget {
  @override
  _ReadmoralState createState() => _ReadmoralState();
}

class _ReadmoralState extends State<Readmoral> {
  ScrollController _scrollController;
  String readtext = """ """;
  String urlPath = "";
  bool isPlaying = false;
  FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController ();
    initializeTts();
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
    _scrollController.dispose();
  }

  initializeTts() {
    _flutterTts = FlutterTts();

    if (PlatformUtil.myPlatform() == MyPlatform.ANDROID) {
      setTtsLanguage();
    } else if (PlatformUtil.myPlatform() == MyPlatform.IOS) {
      setTtsLanguage();
    }

    _flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setErrorHandler((err) {
      setState(() {
        print("พบปัญหา " + err + "\n กรุณาติดต่อ");
        isPlaying = false;
      });
    });
  }

  void setTtsLanguage() async {
    await _flutterTts.setLanguage("en-US" "th-TH");
  }

  void speechSettings1() {
    _flutterTts.setVoice("en-us-x-sfg#female_1-local"); // Android Only!
    _flutterTts.setPitch(1);
    _flutterTts.setSpeechRate(0);
  }

  void speechSettings2() {
    _flutterTts.setVoice("th-TH-x-sfg#female_1-local");
    _flutterTts.setPitch(1); // Key pitch 
    _flutterTts.setSpeechRate(0); // Speech Speed
  }

  Future _speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1)
      setState(() {
        isPlaying = false;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Undark",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 0.5,
                            width: MediaQuery.of(context).size.width / 0.5,
                            child: Image.asset(
                                "assets/images/undark_poster.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Column(
              children: <Widget>[
                
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    color: Colors.green[100],
                      child: Text(readtext,
                      textAlign: TextAlign.left
                    ),
                  ),
                ),
              ],
            ),
                playButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget playButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(
                top: 30, left: 30.0, right: 30.0, bottom: 20.0),
            child: FlatButton(
              onPressed: () {
                //fetch another image
                setState(() {
                  //speechSettings1();
                  isPlaying ? _stop() : _speak(readtext);
                });
              },
              child: isPlaying
                  ? Icon(
                      Icons.stop,
                      size: 60,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: Colors.green,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
