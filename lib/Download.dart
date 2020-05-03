import 'package:carousel_slider/carousel_slider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    Widget image_carousel = new Container(
        child: CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true, height: a.width / 1, initialPage: 2),
      items: [
        'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
        'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
        'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
        'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
      ].map((i) {
        Size a = MediaQuery.of(context).size;
        return Builder(
          builder: (BuildContext context) {
            return Container(
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
                ));
          },
        );
      }).toList(),
    ));

    Widget pageBody2(int selec) {
      switch (selec) {
        case 0:
          return Center(
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
                            color: Colors.black, fontSize: a.width / 25),
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
                                          BorderRadius.circular(a.width / 50),
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
                                            size: a.width / 12,
                                          ),
                                          Text(
                                            "หยุด",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: a.width / 22),
                                          )
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        d = 0;
                                      });
                                    })
                                : RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(a.width / 50),
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
                                                color: Colors.white,
                                                fontSize: a.width / 22),
                                          )
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        d = 1;
                                      });
                                      flush = Flushbar<bool>(
                                        onTap: (flushbar) {
                                          setState(() {
                                            d = 0;
                                          });
                                          Navigator.pop(context);
                                        },
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Color(0xff0D9BFF),
                                        messageText: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.hearing,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: a.width / 1.5,
                                                  child: Marquee(
                                                    child: Text(
                                                      "คุณกำลังฟัง " +
                                                          "ธรรมนูญชุมชนสร้างสุขบนฐานที่สมบูรณ์",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    animationDuration:
                                                        Duration(seconds: 10),
                                                    backDuration: Duration(
                                                        milliseconds: 100),
                                                    pauseDuration: Duration(
                                                        milliseconds: 100),
                                                    directionMarguee:
                                                        DirectionMarguee
                                                            .oneDirection,
                                                    direction: Axis.horizontal,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "หน้า" + "12",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Container(
                                                        child: InkWell(
                                                      child: Icon(
                                                          Icons
                                                              .keyboard_arrow_up,
                                                          color: Colors.white),
                                                      onTap: () {
                                                        print("aaaa");
                                                        setState(() {
                                                          add = 1;
                                                          page = 1;
                                                        });
                                                        Navigator.pop(context);
                                                        flush = Flushbar<bool>(
                                                          onTap: (flushbar) {
                                                            setState(() {
                                                              d = 0;
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          flushbarPosition:
                                                              FlushbarPosition
                                                                  .TOP,
                                                          backgroundColor:
                                                              Color(0xff0D9BFF),
                                                          messageText: Column(
                                                            children: <Widget>[
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                    Icons
                                                                        .hearing,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        a.width /
                                                                            1.5,
                                                                    child:
                                                                        Marquee(
                                                                      child:
                                                                          Text(
                                                                        "คุณกำลังฟัง " +
                                                                            "ธรรมนูญชุมชนสร้างสุขบนฐานที่สมบูรณ์",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      textDirection:
                                                                          TextDirection
                                                                              .ltr,
                                                                      animationDuration:
                                                                          Duration(
                                                                              seconds: 10),
                                                                      backDuration:
                                                                          Duration(
                                                                              milliseconds: 100),
                                                                      pauseDuration:
                                                                          Duration(
                                                                              milliseconds: 100),
                                                                      directionMarguee:
                                                                          DirectionMarguee
                                                                              .oneDirection,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                          child:
                                                                              InkWell(
                                                                        child: Icon(
                                                                            Icons
                                                                                .keyboard_arrow_down,
                                                                            color:
                                                                                Colors.white),
                                                                        onTap:
                                                                            () {
                                                                          print(
                                                                              "aaaa");
                                                                          setState(
                                                                              () {
                                                                            add =
                                                                                1;
                                                                            page =
                                                                                0;
                                                                          });

                                                                          Navigator.pop(
                                                                              context);
                                                                          flush = Flushbar<
                                                                              bool>(
                                                                            onTap:
                                                                                (flushbar) {
                                                                              setState(() {
                                                                                d = 0;
                                                                              });
                                                                              Navigator.pop(context);
                                                                            },
                                                                            flushbarPosition:
                                                                                FlushbarPosition.TOP,
                                                                            backgroundColor:
                                                                                Color(0xff0D9BFF),
                                                                            messageText:
                                                                                Column(
                                                                              children: <Widget>[
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: <Widget>[
                                                                                    Icon(
                                                                                      Icons.hearing,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: a.width / 1.5,
                                                                                      child: Marquee(
                                                                                        child: Text(
                                                                                          "คุณกำลังฟัง " + "ธรรมนูญชุมชนสร้างสุขบนฐานที่สมบูรณ์",
                                                                                          style: TextStyle(color: Colors.white),
                                                                                        ),
                                                                                        textDirection: TextDirection.ltr,
                                                                                        animationDuration: Duration(seconds: 10),
                                                                                        backDuration: Duration(milliseconds: 100),
                                                                                        pauseDuration: Duration(milliseconds: 100),
                                                                                        directionMarguee: DirectionMarguee.oneDirection,
                                                                                        direction: Axis.horizontal,
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
                                                                                          child: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                                                                                          onTap: () {
                                                                                            print("aaaa");
                                                                                            setState(() {
                                                                                              add = 1;
                                                                                              page = 1;
                                                                                            });
                                                                                            Navigator.pop(context);
                                                                                            flush = Flushbar<bool>(
                                                                                              onTap: (flushbar) {
                                                                                                setState(() {
                                                                                                  d = 0;
                                                                                                });
                                                                                                Navigator.pop(context);
                                                                                              },
                                                                                              flushbarPosition: FlushbarPosition.TOP,
                                                                                              backgroundColor: Color(0xff0D9BFF),
                                                                                              messageText: Column(
                                                                                                children: <Widget>[
                                                                                                  Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                    children: <Widget>[
                                                                                                      Icon(Icons.hearing, color: Colors.white),
                                                                                                      SizedBox(
                                                                                                        width: a.width / 1.5,
                                                                                                        child: Marquee(
                                                                                                          child: Text(
                                                                                                            "คุณกำลังฟัง " + "ธรรมนูญชุมชนสร้างสุขบนฐานที่สมบูรณ์",
                                                                                                            style: TextStyle(color: Colors.white),
                                                                                                          ),
                                                                                                          textDirection: TextDirection.ltr,
                                                                                                          animationDuration: Duration(seconds: 10),
                                                                                                          backDuration: Duration(milliseconds: 100),
                                                                                                          pauseDuration: Duration(milliseconds: 100),
                                                                                                          directionMarguee: DirectionMarguee.oneDirection,
                                                                                                          direction: Axis.horizontal,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Row(
                                                                                                        children: <Widget>[
                                                                                                          Container(
                                                                                                              child: InkWell(
                                                                                                            child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                                                                                                            onTap: () {
                                                                                                              print("aaaa");
                                                                                                              setState(() {
                                                                                                                add = 1;
                                                                                                                page = 0;
                                                                                                              });

                                                                                                              Navigator.pop(context);
                                                                                                            },
                                                                                                          ))
                                                                                                        ],
                                                                                                      )
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
                                                                                              ..show(context).then((result) {
                                                                                                setState(() {
                                                                                                  // setState() is optional here
                                                                                                  _wasButtonClicked = result;
                                                                                                });
                                                                                              });
                                                                                          },
                                                                                        ))
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
                                                                            ..show(context).then((result) {
                                                                              setState(() {
                                                                                // setState() is optional here
                                                                                _wasButtonClicked = result;
                                                                              });
                                                                            });
                                                                        },
                                                                      ))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
                                                          ..show(context)
                                                              .then((result) {
                                                            setState(() {
                                                              // setState() is optional here
                                                              _wasButtonClicked =
                                                                  result;
                                                            });
                                                          });
                                                      },
                                                    ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
                                        ..show(context).then((result) {
                                          setState(() {
                                            // setState() is optional here
                                            _wasButtonClicked = result;
                                          });
                                        });
                                    })),
                        SizedBox(
                          width: a.width / 40,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(a.width / 50),
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
          );

        case 1:
          Size a = MediaQuery.of(context).size;
          return Container(
            width: a.width,
            height: a.height,
            color: Color(0xff1490E7),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: a.width / 3, bottom: a.width / 20),
                      width: a.width / 3,
                      height: a.width / 2,
                      color: Colors.white,
                    ),
                    Text(
                      "หน้า",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: a.width / 20),
                      width: a.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                          ),
                          Container(
                            width: a.width / 5,
                            height: a.width / 8,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: a.width,
                      height: a.width,
                      decoration: BoxDecoration(
                          color: Color(0xff9BD5FF),
                          borderRadius: BorderRadius.circular(a.width / 40)),
                      margin: EdgeInsets.only(
                          left: a.width / 20, right: a.width / 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: a.width / 20,
                          left: a.width / 20,
                          right: a.width / 20),
                      width: a.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.favorite_border,
                                      color: Colors.white),
                                  Text("ชื่นชอบ",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              SizedBox(
                                width: a.width / 20,
                              ),
                              Column(
                                children: [
                                  Icon(Icons.textsms, color: Colors.white),
                                  Text(
                                    "ความเห็น",
                                    style: TextStyle(color: Colors.white),
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
                      height: a.width / 2,
                    )
                  ],
                ),
              ],
            ),
          );
      }
    }

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [pageBody2(page)],
      ),
    );
  }
}
