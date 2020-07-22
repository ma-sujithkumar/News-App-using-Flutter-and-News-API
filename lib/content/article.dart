import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewer extends StatefulWidget {
  final String Url;
  ArticleViewer({this.Url});
  @override
  _ArticleViewerState createState() => _ArticleViewerState();
}

class _ArticleViewerState extends State<ArticleViewer> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Tech News",
        style: TextStyle(
          color: Colors.black87,
        ),),
        centerTitle:true,
        backgroundColor: Colors.white,
      ),
       body: Container(
          child:WebView(
              initialUrl: widget.Url,
              onWebViewCreated: ((WebViewController webViewController){
                _completer.complete(webViewController);
              }
              )),
        ),
    );
  }
}
