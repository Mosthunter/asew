import 'package:asew/scard.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Container(
        width: a.width,
        height: a.height,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: a.width / 20,
                      left: a.width / 40,
                      right: a.width / 40),
                  width: a.width,
                  height: a.width / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "ยินดีต้อนรับ ",
                            style: TextStyle(
                                fontSize: a.width / 18,
                                color: Color(0xff188CE3)),
                          ),
                          Text("วันนี้อ่านอะไรดี",
                              style: TextStyle(fontSize: a.width / 18))
                        ],
                      ),
                      Container(
                        width: a.width / 8,
                        height: a.width / 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(a.width),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius:
                                    2.0, // has the effect of softening the shadow
                                spreadRadius:
                                    0.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                ),
                              )
                            ],
                            color: Colors.white),
                        child: Icon(
                          Icons.search,
                          size: a.width / 14,
                          color: Color(0xff188CE3),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: a.width / 20,
                        left: a.width / 40,
                        right: a.width / 40),
                    width: a.width,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "ยอดนิยม",
                          style: TextStyle(
                              color: Colors.black, fontSize: a.width / 18),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(top: a.width / 30),
                  width: a.width,
                  height: a.width / 1.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card2(
                        data1: "100",
                        data2: "201",
                      ),
                      Card2(data1: "125", data2: "526"),
                      Card2(data1: "188", data2: "211")
                    ],
                  ),
                ),
                Container(
                  width: a.width,
                  margin:
                      EdgeInsets.only(left: a.width / 40, right: a.width / 40),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xff707070),
                              width: a.width / 1000))),
                ),
              ],
            ),
            Container(
                width: a.width,
                child: Row(
                  children: <Widget>[
                    Scard(
                      data1: "100",
                      data2: "525",
                    ),
                    Scard(
                      data1: "100",
                      data2: "525",
                    ),
                    Scard(
                      data1: "100",
                      data2: "525",
                    )
                  ],
                )),
            Container(
                width: a.width,
                child: Row(
                  children: <Widget>[
                    Scard(
                      data1: "100",
                      data2: "525",
                    ),
                    Scard(
                      data1: "100",
                      data2: "525",
                    ),
                    Scard(
                      data1: "100",
                      data2: "525",
                    )
                  ],
                )),
            Container(
                width: a.width,
                child: Row(
                  children: <Widget>[
                    Scard(
                      data1: "100",
                      data2: "525",
                    ),
                    Scard(
                      data1: "100",
                      data2: "525",
                    ),
                    Scard(
                      data1: "100",
                      data2: "525",
                    )
                  ],
                )),
                Container(width: a.width,height: a.width/5,)
          ],
        ));
  }
}
