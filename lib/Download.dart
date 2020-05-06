import 'package:asew/Bookshelf.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
//TTS and PDF
//import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'language.dart';
import 'package:asew/platform/myplatform.dart';
import 'package:asew/platform/platform.dart';
import 'ReadBook.dart';

//mmmm
class Download extends StatefulWidget {
  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  int add = 0;
  int d = 0;
  int page = 0;
  Flushbar flush;
  bool _wasButtonClicked;
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  ///TTS Area
  bool isPlaying = false;
  FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    moralTts();
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  moralTts() {
    _flutterTts = FlutterTts();

    if (PlatformUtil.myPlatform() == MyPlatform.ANDROID) {
      {
        setTtsLanguage();
      }
    } else if (PlatformUtil.myPlatform() == MyPlatform.IOS) {
      setTtsLanguage();
    } else if (PlatformUtil.myPlatform() == MyPlatform.WEB) {
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
        print("พบปัญหา" + err + "ไม่สามารถเล่นได้");
        isPlaying = false;
      });
    });
  }

  void setTtsLanguage() async {
    await _flutterTts.setLanguage("th-TH");
  }

  void speechSettings1() {
    _flutterTts.setVoice("th-th-x-sfg#male_1-local");
    _flutterTts.setPitch(1.5);
    _flutterTts.setSpeechRate(.9);
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
    Size a = MediaQuery.of(context).size;
    Widget image_carousel = new Container(
        child: CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true, height: a.width / 1, initialPage: 0),
      items: [
        'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
        'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
        'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
        'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
      ].map((i) {
        Size a = MediaQuery.of(context).size;
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: GestureDetector(
                    child: Container(
                        width: a.width,
                        child: Image.network(
                          i,
                          fit: BoxFit.fill,
                          width: a.width,
                        )),
                  )),
            );
          },
        );
      }).toList(),
    ));
    return Stack(
      children: [
        StreamBuilder(
            stream: Firestore.instance.collection('books').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.active) {
                return Scaffold(
                    key: scaffoldKey,
                    body: Stack(
                      children: [
                        d == 1
                            ? Container(
                                width: a.width,
                                height: a.width / 7,
                                color: Color(0xff0D9BFF),
                                margin: EdgeInsets.only(top: a.width / 17),
                                padding: EdgeInsets.only(
                                    left: a.width / 20, right: a.width / 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(
                                      Icons.hearing,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: a.width / 1.5,
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: a.width / 1.6,
                                        child: Marquee(
                                          child: Text(
                                            "คุณกำลังฟัง " +
                                                snapshot.data.documents[0]
                                                    ['NameBook'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          textDirection: TextDirection.ltr,
                                          animationDuration:
                                              Duration(seconds: 10),
                                          backDuration:
                                              Duration(milliseconds: 100),
                                          pauseDuration:
                                              Duration(milliseconds: 100),
                                          directionMarguee:
                                              DirectionMarguee.oneDirection,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "หน้า" + "12",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                            child: InkWell(
                                          child: Icon(Icons.keyboard_arrow_up,
                                              color: Colors.white),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReadBook()));
                                          },
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                        Center(
                          child: Container(
                            width: a.width,
                            height: a.height / 1.4,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: a.width / 12,
                                    child: Text(
                                      "จำนวนหน้า" + " 146 " + "หน้า",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: a.width / 25),
                                    )),
                                image_carousel,
                                Container(
                                  margin: EdgeInsets.only(top: a.width / 20),
                                  width: a.width,
                                  height: a.width / 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          child: d == 1
                                              ? RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            a.width / 50),
                                                  ),
                                                  color: Color(0xff1490E7),
                                                  child: Container(
                                                    width: a.width / 4,
                                                    height: a.width / 8,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .pause_circle_filled,
                                                          color: Colors.white,
                                                          size: a.width / 12,
                                                        ),
                                                        Text(
                                                          "หยุด",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  a.width / 22),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _stop();
                                                      d = 0;
                                                    });
                                                  })
                                              : RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            a.width / 50),
                                                  ),
                                                  color: Color(0xff1490E7),
                                                  child: Container(
                                                    width: a.width / 4,
                                                    height: a.width / 8,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.surround_sound,
                                                          color: Colors.white,
                                                          size: a.width / 12,
                                                        ),
                                                        Text(
                                                          "ฟังเลย",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  a.width / 22),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isPlaying
                                                          ? _stop()
                                                          : _speak(snapshot.data
                                                                  .documents[0]
                                                              ['Read']);
                                                      d = 1;
                                                    });
                                                  })),
                                      SizedBox(
                                        width: a.width / 40,
                                      ),
                                      RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                a.width / 50),
                                          ),
                                          color: Colors.white,
                                          child: Container(
                                            width: a.width / 4,
                                            height: a.width / 8,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.chrome_reader_mode,
                                                  color: Color(0xff1490E7),
                                                  size: a.width / 12,
                                                ),
                                                Text(
                                                  "อ่านเลย",
                                                  style: TextStyle(
                                                      color: Color(0xfff1490E7),
                                                      fontSize: a.width / 22),
                                                )
                                              ],
                                            ),
                                          ),
                                          onPressed: () {})
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              } else {
                return Center(child: Text("downloding..."));
              }
            })
      ],
    );
  }
}
