import 'package:flutter/material.dart';

import 'card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Container(
      width: a.width,
      height: a.height,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: a.width / 35),
            width: a.width,
            height: a.width / 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius:
                              2.0, // has the effect of softening the shadow
                          spreadRadius:
                              0.0, // has the effect of extending the shadow
                          offset: Offset(
                            0.0, // horizontal, move right 10
                            0.0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(a.width / 60)),
                  width: a.width / 1.3,
                  height: a.width / 7,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: a.width / 40, right: a.width / 40),
                        child: Icon(Icons.search,
                            color: Color(0xffD1CBCB), size: a.width / 12),
                      ),
                      Container(
                        child: Text(
                          "ค้นหาหนังสือ",
                          style: TextStyle(
                              color: Color(0xffD1CBCB), fontSize: a.width / 20),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.all(a.width / 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius:
                                  2.0, // has the effect of softening the shadow
                              spreadRadius:
                                  0.0, // has the effect of extending the shadow
                              offset: Offset(
                                0.0, // horizontal, move right 10
                                0.0, // vertical, move down 10
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(a.width / 60)),
                      width: a.width / 6.5,
                      height: a.width / 7,
                      child: Image.asset(
                        "images/2.png",
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: a.width / 8, left: a.width / 40),
            child: Text(
              "ประกาศ",
              style: TextStyle(color: Colors.black, fontSize: a.width / 18),
            ),
          ),
          Container(
            margin: EdgeInsets.all(a.width / 40),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(a.width / 60)),
            width: a.width,
            height: a.width / 2,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: a.width / 12, left: a.width / 40, right: a.width / 40),
              width: a.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "หนังสือ",
                    style:
                        TextStyle(color: Colors.black, fontSize: a.width / 18),
                  ),
                  Text(
                    "ไปที่ชั้นหนังสือ",
                    style: TextStyle(
                        color: Color(0xff188CE3), fontSize: a.width / 18),
                  )
                ],
              )),
          Container(
            width: a.width,
            height: a.width / 1.4,
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
          Container(width: a.width, height: a.width / 5)
        ],
      ),
    );
  }
}
