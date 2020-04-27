import 'package:flutter/material.dart';

class Scard extends StatefulWidget {
  final String data1;
  final String data2;
  Scard({@required this.data1, @required this.data2});
  @override
  _ScardState createState() => _ScardState();
}

class _ScardState extends State<Scard> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(a.width / 40),
      width: a.width / 3.6,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(a.width / 40),
              color: Colors.green,
            ),
            width: a.width / 3.5,
            height: a.width / 3,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: a.width / 60,
                        right: a.width / 60,
                        left: a.width / 60),
                    child: Icon(
                      Icons.visibility,
                      color: Color(0xff4E4E4E),
                      size: a.width/32,
                    )),
                Text(
                  "การเข้าชม " + widget.data1 + " ครั้ง",
                  style: TextStyle(color: Color(0xff4E4E4E),fontSize: a.width/40),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(a.width / 60),
                    child: Icon(Icons.favorite, color: Color(0xff4E4E4E), size: a.width/32)),
                Text(
                  "ถูกใจ " + widget.data2 + " ครั้ง",
                  style: TextStyle(color: Color(0xff4E4E4E),fontSize: a.width/40),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
