import 'package:c_slides_show/src/models/slider_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
   
  const SlideShowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SliderModelProvider(),
      child: Scaffold(
        body: Center(
           child: Column(
             children: const [
    
               Expanded( // expanded toma todo el tamano disponible
                child: _Slides()
              ),
    
               _Dots()
             ],
           )
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [

          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),

        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderModelProvider = Provider.of<SliderModelProvider>(context);
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: sliderModelProvider.currentPage.round() == index ? Color.fromARGB(255, 0, 42, 227) : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  // al usar una PageView() se tiene acceso al PageviewController que permite ver en que pagina se encuentra
  final pageViewController = new PageController();
  @override
  void initState() {
    pageViewController.addListener(() {
      print('jean pagina: ${pageViewController.page}');
      // actualizar el provider
      final sliderModelProvider = Provider.of<SliderModelProvider>(context, listen: false);
      sliderModelProvider.currentPage = pageViewController.page!;
      
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: PageView(
        controller: pageViewController,
        physics: const BouncingScrollPhysics(),
        children: const [
          _Slide(svg: 'assets/svgs/slide-1.svg'),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'), 
        ],
      )
    );
  }
}

class _Slide extends StatelessWidget { 
  final String svg;
  
  const _Slide({
    Key? key, 
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}