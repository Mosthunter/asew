import 'package:flutter/material.dart';

class Card2 extends StatefulWidget {
  final String data1;
  final String data2;
  Card2({@required this.data1, @required this.data2});
  @override
  _Card2State createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(a.width / 40),
      width: a.width / 2.5,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(a.width / 40),
              color: Colors.green,
            ),
            width: a.width / 2.5,
            height: a.width / 2,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: a.width / 60,
                        right: a.width / 60,
                        left: a.width / 60),
                    child: Icon(
                      Icons.visibility,
                      color: Color(0xff4E4E4E),
                    )),
                Text(
                  "การเข้าชม " + widget.data1 + " ครั้ง",
                  style: TextStyle(color: Color(0xff4E4E4E)),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(a.width / 60),
                    child: Icon(Icons.favorite, color: Color(0xff4E4E4E))),
                Text(
                  "ถูกใจ " + widget.data2 + " ครั้ง",
                  style: TextStyle(color: Color(0xff4E4E4E)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
