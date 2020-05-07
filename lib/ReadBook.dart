import 'package:asew/platform/mobile.dart';
import 'package:asew/platform/myplatform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:marquee_widget/marquee_widget.dart';

class ReadBook extends StatefulWidget {
  @override
  _ReadBookState createState() => _ReadBookState();
}

//Show PDF and TTS text
class _ReadBookState extends State<ReadBook> {
  int page = 1;
  int d = 0;
  bool isPlaying = false;
  var read =
      "ฮากกาคันยิ โอเปร่า แซนด์วิชวินพรีเมียมบัส ดีไซน์โลโก้เอนทรานซ์พาเหรด ก๋ากั่นหมวยมัฟฟิน ยิมหงวนแฮมเบอร์เกอร์วิภัชภาคแผดเผา ไฮเวย์ล็อบบี้ติ่มซำแมมโบ้แพ็ค คันธาระล้มเหลวไคลแม็กซ์ เป็นไงจอหงวนตื้บเทียมทาน จูนแช่แข็งซิ้ม โหลน สโตนแจ๊กพ็อตรายชื่อซาดิสม์เสกสรรค์ สะบึมส์คอนโดมิเนียมไลฟ์อพาร์ทเมนต์ โบว์วอลนัตบ็อกซ์เฟิร์ม รีสอร์ท แซ็กโซโฟนเทปโปรเจ็กเตอร์";
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
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Column(
              children: [
                Container(
                  width: a.width,
                  height: a.height / 1,
                  color: Color(0xff0D9BFF),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: a.width / 3, bottom: a.width / 20),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius:
                                        10.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        10.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      0.0, // horizontal, move right 10
                                      0.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("images/book1.png")),
                                borderRadius:
                                    BorderRadius.circular(a.width / 50)),
                            width: a.width / 2.2,
                            height: a.width / 1.7,
                            child: Center(
                              child: Container(
                                width: a.width / 8,
                                height: a.width / 8,
                                decoration: BoxDecoration(
                                    color: Color(0xff0D9BFF),
                                    borderRadius:
                                        BorderRadius.circular(a.width)),
                                child: d == 0
                                    ? InkWell(
                                        child: Icon(
                                          Icons.pause_circle_filled,
                                          color: Colors.white,
                                          size: a.width / 13,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            d = 1;
                                            isPlaying ? _stop() : _speak(read);
                                          });
                                        },
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.white,
                                          size: a.width / 13,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            d = 0;
                                            isPlaying ? _stop() : _speak(read);
                                          });
                                        },
                                      ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: a.width / 15, bottom: a.width / 20),
                            width: a.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: a.width / 40),
                                        width: a.width / 8,
                                        height: a.width / 8,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius:
                                                    10.0, // has the effect of softening the shadow
                                                spreadRadius:
                                                    2.0, // has the effect of extending the shadow
                                                offset: Offset(
                                                  0.0, // horizontal, move right 10
                                                  0.0, // vertical, move down 10
                                                ),
                                              )
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                a.width / 20)),
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Color(0xff0D9BFF),
                                          size: a.width / 15,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    Text(
                                      "กลับ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: a.width / 20),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: a.width / 20, right: a.width / 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: a.width / 40),
                                        width: a.width / 4,
                                        height: a.width / 8,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius:
                                                    10.0, // has the effect of softening the shadow
                                                spreadRadius:
                                                    2.0, // has the effect of extending the shadow
                                                offset: Offset(
                                                  0.0, // horizontal, move right 10
                                                  0.0, // vertical, move down 10
                                                ),
                                              )
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(a.width)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          page.toString(),
                                          style: TextStyle(
                                              color: Color(0xff0D9BFF),
                                              fontSize: a.width / 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "หน้า",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: a.width / 20),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: a.width / 40),
                                          width: a.width / 8,
                                          height: a.width / 8,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius:
                                                      10.0, // has the effect of softening the shadow
                                                  spreadRadius:
                                                      2.0, // has the effect of extending the shadow
                                                  offset: Offset(
                                                    0.0, // horizontal, move right 10
                                                    0.0, // vertical, move down 10
                                                  ),
                                                )
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      a.width / 20)),
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0xff0D9BFF),
                                            size: a.width / 15,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            page = page + 1;
                                          });
                                        }),
                                    Text(
                                      "ต่อไป",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: a.width / 20),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: a.width,
                            height: a.width,
                            decoration: BoxDecoration(
                                color: Color(0xff9BD5FF),
                                borderRadius:
                                    BorderRadius.circular(a.width / 40)),
                            margin: EdgeInsets.only(
                                left: a.width / 20, right: a.width / 20),
                            child: Container(
                              padding: EdgeInsets.all(a.width / 50),
                              child: SizedBox(
                                  width: a.width / 1.5,
                                  child: Marquee(
                                    child: Text(
                                      read,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    textDirection: TextDirection.ltr,
                                    animationDuration: Duration(seconds: 30),
                                    backDuration: Duration(milliseconds: 100),
                                    pauseDuration: Duration(milliseconds: 100),
                                    directionMarguee:
                                        DirectionMarguee.oneDirection,
                                    direction: Axis.vertical,
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: a.width / 10,
                                left: a.width / 20,
                                right: a.width / 20,
                                bottom: a.width / 10),
                            width: a.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                          size: a.width / 15,
                                        ),
                                        Text("ชื่นชอบ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    SizedBox(
                                      width: a.width / 20,
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.textsms,
                                          color: Colors.white,
                                          size: a.width / 15,
                                        ),
                                        Text(
                                          "ความเห็น",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: a.width / 15,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: a.width,
          height: a.width / 7,
          color: Color(0xff0D9BFF),
          margin: EdgeInsets.only(top: a.width / 17),
          padding: EdgeInsets.only(left: a.width / 20, right: a.width / 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.hearing,
                color: Colors.white,
              ),
              Container(
                width: a.width / 1.3,
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: a.width / 1.6,
                  child: Marquee(
                    child: Text(
                      "คุณกำลังฟัง " + "ธรรมนูญชุมชนสร้างสุขบนฐานที่สมบูรณ์",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: a.width / 25),
                    ),
                    textDirection: TextDirection.ltr,
                    animationDuration: Duration(seconds: 10),
                    backDuration: Duration(milliseconds: 100),
                    pauseDuration: Duration(milliseconds: 100),
                    directionMarguee: DirectionMarguee.oneDirection,
                    direction: Axis.horizontal,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                      child: InkWell(
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ))
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
