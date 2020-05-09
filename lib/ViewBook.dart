import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;
  int page = 1;
  int favorite = 0;

  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
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
              : Offstage(),
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.only(left: a.width / 30, right: a.width / 30),
              margin: EdgeInsets.only(top: a.width / 17),
              width: a.width,
              height: a.width / 7,
              color: Color(0xff0D9BFF),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: a.width / 12,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "ธรรมนูญชุมชนสร้างสุขบนฐานที่สมบูรณ์",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: a.width / 25),
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: a.width / 15,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: a.width,
              height: a.width / 4.5,
              color: Color(0xff0D9BFF),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: a.width / 15),
                    width: a.width / 2.3,
                    height: a.width / 4.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            favorite == 0
                                ? InkWell(
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        favorite = 1;
                                      });
                                    },
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        favorite = 0;
                                      });
                                    },
                                  ),
                            Text(
                              "ชื่นชอบ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.sms, color: Colors.white),
                            Text("ความเห็น",
                                style: TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.volume_up, color: Colors.white),
                            Text("เปิดเสียง",
                                style: TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: a.width / 30),
                    height: a.width / 4.5,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            _currentPage == 0
                                ? Container(
                                    margin:
                                        EdgeInsets.only(bottom: a.width / 80),
                                    width: a.width / 9,
                                    height: a.width / 9,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius:
                                                10.0, // has the effect of softening the shadow
                                            spreadRadius:
                                                2.0, // has the effect of extending the shadow
                                            offset: Offset(
                                              0.0, // horizontal, move right 10
                                              0.0, // vertical, move down 10
                                            ),
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            a.width / 20)),
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: Color(0xff0D9BFF),
                                      size: a.width / 15,
                                    ),
                                  )
                                : InkWell(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(bottom: a.width / 80),
                                      width: a.width / 9,
                                      height: a.width / 9,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius:
                                                  10.0, // has the effect of softening the shadow
                                              spreadRadius:
                                                  2.0, // has the effect of extending the shadow
                                              offset: Offset(
                                                0.0, // horizontal, move right 10
                                                0.0, // vertical, move down 10
                                              ),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              a.width / 20)),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Color(0xff0D9BFF),
                                        size: a.width / 15,
                                      ),
                                    ),
                                    onTap: () {
                                      _currentPage -= 1;
                                      _pdfViewController.setPage(_currentPage);
                                    },
                                  ),
                            Text(
                              "กลับ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: a.width / 30),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: a.width / 25, right: a.width / 25),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: a.width / 80),
                                width: a.width / 5,
                                height: a.width / 9,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius:
                                            10.0, // has the effect of softening the shadow
                                        spreadRadius:
                                            2.0, // has the effect of extending the shadow
                                        offset: Offset(
                                          0.0, // horizontal, move right 10
                                          0.0, // vertical, move down 10
                                        ),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(a.width)),
                                alignment: Alignment.center,
                                child: Text(
                                  "${_currentPage + 1}",
                                  style: TextStyle(
                                      color: Color(0xff0D9BFF),
                                      fontSize: a.width / 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "หน้า",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: a.width / 30),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            _currentPage < _totalPages - 1
                                ? InkWell(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(bottom: a.width / 80),
                                      width: a.width / 9,
                                      height: a.width / 9,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius:
                                                  10.0, // has the effect of softening the shadow
                                              spreadRadius:
                                                  2.0, // has the effect of extending the shadow
                                              offset: Offset(
                                                0.0, // horizontal, move right 10
                                                0.0, // vertical, move down 10
                                              ),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              a.width / 20)),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xff0D9BFF),
                                        size: a.width / 15,
                                      ),
                                    ),
                                    onTap: () {
                                      // if (page+1 < totalPg)
                                      _currentPage += 1;
                                      _pdfViewController.setPage(_currentPage);
                                    })
                                : Container(
                                    margin:
                                        EdgeInsets.only(bottom: a.width / 80),
                                    width: a.width / 9,
                                    height: a.width / 9,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius:
                                                10.0, // has the effect of softening the shadow
                                            spreadRadius:
                                                2.0, // has the effect of extending the shadow
                                            offset: Offset(
                                              0.0, // horizontal, move right 10
                                              0.0, // vertical, move down 10
                                            ),
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            a.width / 20)),
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color(0xff0D9BFF),
                                      size: a.width / 15,
                                    ),
                                  ),
                            Text(
                              "ต่อไป",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: a.width / 30),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
