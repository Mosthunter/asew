import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class TextTest extends StatefulWidget {
  @override
  _TextTestState createState() => _TextTestState();
}

class _TextTestState extends State<TextTest> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: a.width/2,
          padding: EdgeInsets.only(top: a.width / 5),
          child: SizedBox(
            width: a.width/5,
            
            child: Marquee(
              child: Text(
                  'This project is a starting point for a Dart package, a library module containing code that can be shared easily across multiple Flutter or Dart projects. '),
              textDirection: TextDirection.ltr,
              animationDuration: Duration(seconds: 20),
              backDuration: Duration(milliseconds: 100),
              pauseDuration: Duration(milliseconds: 100),
              directionMarguee: DirectionMarguee.oneDirection,
              direction: Axis.horizontal,
            ),
          )),
    );
  }
}
