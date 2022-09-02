import 'package:flutter/material.dart';

import 'package:c_slides_show/src/pages/slide_show_page.dart';

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