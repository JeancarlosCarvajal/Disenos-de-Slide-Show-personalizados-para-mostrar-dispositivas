import 'package:flutter/material.dart';

import 'package:c_slides_show/src/widgets/slide_show.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
   
  const SlideShowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(  
          children: const [
            _MiSlideShow(),
            _MiSlideShow(),
            _MiSlideShow(),
            _MiSlideShow(), 
          ],
        ),
      ), 
    );
  }
}

class _MiSlideShow extends StatelessWidget {
  const _MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print('jean: ${size.height}');    
    return SizedBox(
      height: size.height*0.5,
      child: SlideShow(
        bulletPrimario: 15,
        bulletSecundario: 12,
        // puntosArriba: true,
        colorPrimario: Color.fromARGB(255, 0, 153, 255),
        // colorSecundario: Colors.white,
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