import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'PDFBOOKS.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ThaiSans',
        
        primarySwatch: Colors.blue,
      ),
      home: PDFBOOKS(),
    );
  }
}

