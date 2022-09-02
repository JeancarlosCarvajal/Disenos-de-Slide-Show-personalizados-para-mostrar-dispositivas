
import 'package:c_slides_show/src/pages/slides_show_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenos App',
      home: SlideShowPage(),
    );
  }
}