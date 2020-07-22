import 'package:flutter/material.dart';
import 'package:stories_app/content/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"News App",
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}
