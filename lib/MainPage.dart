import 'package:asew/widget/card.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _drawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      key: _drawerKey,
      endDrawer: Container(
        height: a.height,
        width: a.width / 2,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(a.width / 30),
              width: a.width,
              alignment: Alignment.topLeft,
              child: InkWell(
                child: Icon(
                  Icons.clear,
                  size: a.width / 10,
                  color: Color(0xff1F82DA),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: a.width / 20),
            Container(
              margin: EdgeInsets.only(
                  top: a.width / 20, left: a.width / 20, bottom: a.width / 40),
              width: a.width,
              alignment: Alignment.topLeft,
              child: Text(
                "ข้อกำหนดการใช้งาน",
                style: TextStyle(fontSize: a.width / 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: a.width / 20, left: a.width / 20, bottom: a.width / 40),
              width: a.width,
              alignment: Alignment.topLeft,
              child: Text("เสนอแนะ", style: TextStyle(fontSize: a.width / 20)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: a.width / 20, left: a.width / 20, bottom: a.width / 40),
              width: a.width,
              alignment: Alignment.topLeft,
              child: Text("การตั้งค่าเอไอ",
                  style: TextStyle(fontSize: a.width / 20)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: a.width / 20, left: a.width / 20, bottom: a.width / 40),
              width: a.width,
              alignment: Alignment.topLeft,
              child: Text("เว็บไซต์ศูนย์คุณธรรม",
                  style: TextStyle(fontSize: a.width / 20)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: a.width / 20, left: a.width / 20, bottom: a.width / 40),
              width: a.width,
              alignment: Alignment.topLeft,
              child: Text("คลังข้อมูลดิจิตอล",
                  style: TextStyle(fontSize: a.width / 20)),
            ),
            SizedBox(
              height: a.width / 1.9,
            ),
            Container(
              margin: EdgeInsets.only(bottom: a.width / 30),
              width: a.width / 3,
              height: a.width / 8,
              decoration: BoxDecoration(
                  color: Color(0xff1F82DA),
                  borderRadius: BorderRadius.circular(a.width)),
              alignment: Alignment.center,
              child: Text(
                "เข้าสู่ระบบผู้ดูแล",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              "เวอร์ชัน : 1.0.0",
              style: TextStyle(color: Color(0xff707070)),
            )
          ],
        ),
      ),
      body: Container(
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
                                color: Color(0xffD1CBCB),
                                fontSize: a.width / 20),
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
                        child: InkWell(
                          child: Image.asset(
                            "images/2.png",
                          ),
                          onTap: () {
                            _drawerKey.currentState.openEndDrawer();
                          },
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
                      style: TextStyle(
                          color: Colors.black, fontSize: a.width / 18),
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
      ),
    );
  }
}
