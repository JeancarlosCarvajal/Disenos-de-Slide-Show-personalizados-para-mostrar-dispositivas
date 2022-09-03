import 'package:flutter/material.dart';

import 'package:c_slides_show/src/widgets/slide_show.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
   
  const SlideShowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SlideShow(
        bulletPrimario: 20,
        bulletSecundario: 10,
        // puntosArriba: true,
        colorPrimario: Color.fromARGB(255, 51, 255, 0),
        colorSecundario: Colors.white,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'), 
          SvgPicture.asset('assets/svgs/slide-4.svg'), 
          SvgPicture.asset('assets/svgs/slide-5.svg'), 
        ]
      ), 
    );
  }
}