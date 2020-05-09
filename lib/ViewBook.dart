import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;


class ViewBook extends StatefulWidget {
  final String path;
  const ViewBook({Key key, this.path}) : super(key: key);
  @override
  _ViewBookState createState() => _ViewBookState();
}

class _ViewBookState extends State<ViewBook> {
  String assetPath = "";
  String urlPath = "";
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;
  @override
  void initState(){
    super.initState();

    getFromAsset("assets/mypdf.pdf").then((f) {
      setState(() {
        assetPath = f.path;
        print(assetPath);
      });
    });

    getFromUrl("https://pdfkit.org/docs/guide.pdf").then((f) {
      setState(() {
        urlPath = f.path;
        print(urlPath);
      });
    });
  }
  Future<File> getFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");
      
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e){
      throw Exception("ไม่สามารถเปิดไฟล์ที่ดาวน์โหลดมาได้");
    }
  }
  Future<File> getFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");
      
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e){
      throw Exception("ไม่สามารถเปิดไฟล์จากเซิร์ฟเวอร์ได้");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("หัวข้อหนังสือ"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage+1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}
