import 'package:asew/ViewBook.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'ReadBook.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

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
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  String assetPDFPath = "";
  String urlPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromAsset("images/guide.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });

    getFileFromUrl("https://pdfkit.org/docs/guide.pdf").then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  //widget image_carousel สำหรับเรียกใช้
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    Widget image_carousel = new Container(
        height: a.height / 1.765,
        width: a.width,
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            initialPage: 0,
            height: a.width / 1,
            onPageChanged: (index, reason) {
              print(index);
            },
          ),
          items: ["images/noodee.png", "images/asean.png", "images/book1.png"]
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
                  height: a.height / 1.3,
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
                              child: InkWell(
                                child: Container(
                                  width: a.width / 3,
                                  height: a.width / 7.5,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xff1490E7),
                                    borderRadius:
                                        BorderRadius.circular(a.width / 50),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.surround_sound,
                                        color: Colors.white,
                                        size: a.width / 12,
                                      ),
                                      SizedBox(
                                        width: a.width / 40,
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReadBook(),
                                      ));
                                },
                              ),
                            ),
                            SizedBox(
                              width: a.width / 40,
                            ),
                            InkWell(
                              child: Container(
                                width: a.width / 3,
                                height: a.width / 7.5,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(a.width / 50),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.chrome_reader_mode,
                                      color: Color(0xff1490E7),
                                      size: a.width / 12,
                                    ),
                                    SizedBox(
                                      width: a.width / 40,
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
                              onTap: () {
                                if (assetPDFPath != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PdfViewPage(
                                              path:
                                                  urlPDFPath))); //ถ้าดึง pdf จาก url ใช้ urlPDFPath แต่ถ้าดึงมาจาก images/ ใช้ assetsPDFPath
                                }
                              },
                            ),
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
