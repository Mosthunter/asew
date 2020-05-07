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
  //ตัวแปร d คือ เปลี่ยนแปลง ปุ่ม ฟังเลย เป็น หยุด และ จากหยุด เป็น ฟังเลย
  int d = 0;
  int page = 0;

  // var read = "ฮากกาคันยิ โอเปร่า แซนด์วิชวินพรีเมียมบัส ดีไซน์โลโก้เอนทรานซ์พาเหรด ก๋ากั่นหมวยมัฟฟิน ยิมหงวนแฮมเบอร์เกอร์วิภัชภาคแผดเผา ไฮเวย์ล็อบบี้ติ่มซำแมมโบ้แพ็ค คันธาระล้มเหลวไคลแม็กซ์ เป็นไงจอหงวนตื้บเทียมทาน จูนแช่แข็งซิ้ม โหลน สโตนแจ๊กพ็อตรายชื่อซาดิสม์เสกสรรค์ สะบึมส์คอนโดมิเนียมไลฟ์อพาร์ทเมนต์ โบว์วอลนัตบ็อกซ์เฟิร์ม รีสอร์ท แซ็กโซโฟนเทปโปรเจ็กเตอร์"Flushbar flush;
  bool _wasButtonClicked;
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  // ///TTS Area
  // bool isPlaying = false;
  // FlutterTts _flutterTts;

  // @override
  // void initState() {
  //   super.initState();
  //   moralTts();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _flutterTts.stop();
  // }

  // moralTts() {
  //   _flutterTts = FlutterTts();

  //   if (PlatformUtil.myPlatform() == MyPlatform.ANDROID) {
  //     {
  //       setTtsLanguage();
  //     }
  //   } else if (PlatformUtil.myPlatform() == MyPlatform.IOS) {
  //     setTtsLanguage();
  //   } else if (PlatformUtil.myPlatform() == MyPlatform.WEB) {
  //     setTtsLanguage();
  //   }

  //   _flutterTts.setStartHandler(() {
  //     setState(() {
  //       isPlaying = true;
  //     });
  //   });

  //   _flutterTts.setCompletionHandler(() {
  //     setState(() {
  //       isPlaying = false;
  //     });
  //   });

  //   _flutterTts.setErrorHandler((err) {
  //     setState(() {
  //       print("พบปัญหา" + err + "ไม่สามารถเล่นได้");
  //       isPlaying = false;
  //     });
  //   });
  // }

  // void setTtsLanguage() async {
  //   await _flutterTts.setLanguage("th-TH");
  // }

  // void speechSettings1() {
  //   _flutterTts.setVoice("th-th-x-sfg#male_1-local");
  //   _flutterTts.setPitch(1.5);
  //   _flutterTts.setSpeechRate(.9);
  // }

  // Future _speak(String text) async {
  //   if (text != null && text.isNotEmpty) {
  //     var result = await _flutterTts.speak(text);
  //     if (result == 1)
  //       setState(() {
  //         isPlaying = true;
  //       });
  //   }
  // }

  // Future _stop() async {
  //   var result = await _flutterTts.stop();
  //   if (result == 1)
  //     setState(() {
  //       isPlaying = false;
  //     });
  // }

  //widget image_carousel สำหรับเรียกใช้
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    Widget image_carousel = new Container(
        height: a.height / 1.765,
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            initialPage: 0,
            height: a.width / 1,
            onPageChanged: (index, reason) {
              print(index);
            },
          ),
          items: ["images/book1.png", "images/asean.png", "images/noodee.png"]
              .map((i) {
            Size a = MediaQuery.of(context).size;
            return Container(
                margin: EdgeInsets.symmetric(horizontal: a.width / 25),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[350],
                        blurRadius:
                            10.0, // has the effect of softening the shadow
                        spreadRadius:
                            5.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(a.width / 50)),
                child: Stack(
                  children: [
                    Container(
                      width: a.width / 1.2,
                      height: a.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: AssetImage(i)),
                          borderRadius: BorderRadius.circular(a.width / 50)),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.all(a.width / 20),
                        width: a.width / 9,
                        height: a.width / 9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(a.width),
                            color: Colors.black38),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: a.width / 14,
                        ),
                      ),
                    ),
                  ],
                ));
          }).toList(),
        ));
    return Stack(children: [
      Scaffold(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "คุณกำลังฟัง " + "",
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
                              Text(
                                "หน้า" + "12",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: a.width / 25),
                              ),
                              Container(
                                  child: InkWell(
                                child: Icon(Icons.keyboard_arrow_up,
                                    color: Colors.white),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReadBook()));
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
                          alignment: Alignment.bottomCenter,
                          height: a.width / 12,
                          child: Text(
                            "จำนวนหน้า" + " 146 " + "หน้า",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: a.width / 24),
                          )),
                      image_carousel,
                      Container(
                        width: a.width,
                        height: a.width / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: d == 1
                                    ? RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              a.width / 50),
                                        ),
                                        color: Color(0xff1490E7),
                                        child: Container(
                                          width: a.width / 4,
                                          height: a.width / 8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Icon(
                                                Icons.pause_circle_filled,
                                                color: Colors.white,
                                                size: a.width / 10,
                                              ),
                                              Text(
                                                "หยุด",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: a.width / 20),
                                              )
                                            ],
                                          ),
                                        ),
                                        onPressed: () {})
                                    : RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              a.width / 50),
                                        ),
                                        color: Color(0xff1490E7),
                                        child: Container(
                                          width: a.width / 4,
                                          height: a.width / 8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Icon(
                                                Icons.surround_sound,
                                                color: Colors.white,
                                                size: a.width / 12,
                                              ),
                                              Text(
                                                "ฟังเลย",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: a.width / 20),
                                              )
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ReadBook(),
                                              ));
                                        })),
                            SizedBox(
                              width: a.width / 40,
                            ),
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(a.width / 50),
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
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfff1490E7),
                                            fontSize: a.width / 20),
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
          ))
    ]);
  }
}
