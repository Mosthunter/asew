import 'package:flutter/material.dart';

import 'Bookshelf.dart';
import 'Download.dart';
import 'MainPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 0;
  Widget pageBody(int selec) {
    switch (selec) {
      case 0:
        return MainPage();
        break;

      case 1:
        return Bookshelf();
        break;

      case 2:
        return Download();
        break;

      default:
        return MainPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: a.width,
            height: a.height,
            child: pageBody(page),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: a.width,
              height: a.width / 7,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      10.0, // horizontal, move right 10
                      20.0, // vertical, move down 10
                    ),
                  )
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(top: a.width / 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    butBotBar(Icons.home, 0, "หน้าหลัก", page == 0),
                    butBotBar(Icons.book, 1, "ชั้นหนังสือ", page == 1),
                    butBotBar(Icons.cloud_download, 2, "ดาวน์โหลด", page == 2)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget butBotBar(IconData icon, int select, String data, bool active) {
    Size a = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: active ? Color(0xff1F82DA) : Color(0xff6F6F6F),
              size: MediaQuery.of(context).size.width / 13,
            ),
            Text(
              data,
              style: TextStyle(
                  color: active ? Color(0xff1F82DA) : Color(0xff6F6F6F) ,fontSize: a.width/30),
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          page = select;
        });
      },
    );
  }
}
