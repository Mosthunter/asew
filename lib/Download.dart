import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Image.dart';

class Download extends StatefulWidget {
  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
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

    return Scaffold(
      body: Center(
        child: Container(
          width: a.width,
          height: a.height / 1.4,
          child: Column(
            children: <Widget>[
              Container(
                  height: a.width / 12,
                  child: Text(
                    "จำนวนหน้า" + " 146 " + "หน้า",
                    style:
                        TextStyle(color: Colors.black, fontSize: a.width / 25),
                  )),
              image_carousel,
              Container(
                margin: EdgeInsets.only(top: a.width / 20),
                width: a.width,
                height: a.width / 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                       shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(a.width / 50),
                        ),
                        color: Color(0xff1490E7),
                        child: Container(
                          width: a.width / 4,
                          height: a.width / 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        onPressed: () {}),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
