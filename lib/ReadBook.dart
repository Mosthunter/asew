import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class ReadBook extends StatefulWidget {
  @override
  _ReadBookState createState() => _ReadBookState();
}

//Show PDF and TTS text
class _ReadBookState extends State<ReadBook> {
  int page = 1;
  String read =
      "ฮากกาคันยิ โอเปร่า แซนด์วิชวินพรีเมียมบัส ดีไซน์โลโก้เอนทรานซ์พาเหรด ก๋ากั่นหมวยมัฟฟิน ยิมหงวนแฮมเบอร์เกอร์วิภัชภาคแผดเผา ไฮเวย์ล็อบบี้ติ่มซำแมมโบ้แพ็ค คันธาระล้มเหลวไคลแม็กซ์ เป็นไงจอหงวนตื้บเทียมทาน จูนแช่แข็งซิ้ม โหลน สโตนแจ๊กพ็อตรายชื่อซาดิสม์เสกสรรค์ สะบึมส์คอนโดมิเนียมไลฟ์อพาร์ทเมนต์ โบว์วอลนัตบ็อกซ์เฟิร์ม รีสอร์ท แซ็กโซโฟนเทปโปรเจ็กเตอร์";
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        StreamBuilder(
            stream: Firestore.instance.collection('books').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.active) {
                return ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: a.width,
                          height: a.height / 1,
                          color: Color(0xff1490E7),
                          child: ListView(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: a.width / 3, bottom: a.width / 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            a.width / 25)),
                                    width: a.width / 2.2,
                                    height: a.width / 1.7,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: a.width / 15,
                                        bottom: a.width / 20),
                                    width: a.width,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            page == 1
                                                ? InkWell(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: a.width / 40),
                                                      width: a.width / 8,
                                                      height: a.width / 8,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      a.width /
                                                                          20)),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_left,
                                                        color:
                                                            Color(0xff0D9BFF),
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                  )
                                                : InkWell(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: a.width / 40),
                                                      width: a.width / 8,
                                                      height: a.width / 8,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      a.width /
                                                                          20)),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_left,
                                                        color:
                                                            Color(0xff0D9BFF),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        page = page - 1;
                                                      });
                                                    },
                                                  ),
                                            Text(
                                              "กลับ",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: a.width / 25,
                                              right: a.width / 25),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: a.width / 40),
                                                width: a.width / 4,
                                                height: a.width / 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            a.width)),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  page.toString(),
                                                  style: TextStyle(
                                                      color: Color(0xff0D9BFF),
                                                      fontSize: a.width / 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                "หน้า",
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              a.width / 20)),
                                                  child: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: Color(0xff0D9BFF),
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
                                                  color: Colors.white),
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
                                        borderRadius: BorderRadius.circular(
                                            a.width / 40)),
                                    margin: EdgeInsets.only(
                                        left: a.width / 20,
                                        right: a.width / 20),
                                    child: Container(
                                      padding: EdgeInsets.all(a.width / 50),
                                      child: SizedBox(
                                          width: a.width / 1.5,
                                          child: Marquee(
                                            child: Text(
                                              snapshot.data.documents[0]['Read'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: a.width / 20),
                                            ),
                                            textDirection: TextDirection.ltr,
                                            animationDuration:
                                                Duration(seconds: 30),
                                            backDuration:
                                                Duration(milliseconds: 100),
                                            pauseDuration:
                                                Duration(milliseconds: 100),
                                            directionMarguee:
                                                DirectionMarguee.oneDirection,
                                            direction: Axis.vertical,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: a.width / 15,
                                        left: a.width / 20,
                                        right: a.width / 20,
                                        bottom: a.width / 15),
                                    width: a.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Icon(Icons.favorite_border,
                                                    color: Colors.white),
                                                Text("ชื่นชอบ",
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(
                                              width: a.width / 20,
                                            ),
                                            Column(
                                              children: [
                                                Icon(Icons.textsms,
                                                    color: Colors.white),
                                                Text(
                                                  "ความเห็น",
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                );
              }
            }),
        StreamBuilder(
            stream: Firestore.instance.collection('books').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.active) {
                return Container(
                  width: a.width,
                  height: a.width / 7,
                  color: Color(0xff0D9BFF),
                  margin: EdgeInsets.only(top: a.width / 17),
                  padding:
                      EdgeInsets.only(left: a.width / 20, right: a.width / 20),
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
                              "คุณกำลังฟัง " +
                                  snapshot.data.documents[0]['NameBook'],
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
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: InkWell(
                            child: Icon(Icons.keyboard_arrow_down,
                                color: Colors.white),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ))
                        ],
                      )
                    ],
                  ),
                );
              }
            })
      ],
    ));
  }
}
