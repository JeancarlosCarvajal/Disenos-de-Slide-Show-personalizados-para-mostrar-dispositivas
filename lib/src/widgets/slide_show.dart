import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:c_slides_show/src/models/slider_model_provider.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
   
  const SlideShow({
    Key? key, 
    required this.slides, 
    this.puntosArriba    = false, 
    this.colorPrimario   = const Color.fromARGB(255, 0, 42, 227), 
    this.colorSecundario = Colors.grey
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModelProvider(),    
      child: Builder( // agrege el builder para poder acceder al provider y asignar los colores alli
        builder: (BuildContext context) {
          return SafeArea(
            child: Center(
                child: Column(
                  children: puntosArriba ? arrayWidget.reversed.toList() : arrayWidget
                )
            ),
          ); 
        },
      ),
    );
  }

  List<Widget> get arrayWidget {
    return [ 
      Expanded( // expanded toma todo el tamano disponible
        child: _Slides(slides: slides)
      ), 
      _Dots(slides: slides, colorPrimario: colorPrimario, colorSecundario: colorSecundario,), 
    ];
  }

}


class _Dots extends StatelessWidget {

  final List<Widget> slides; 
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dots({
    Key? key, 
    required this.slides, 
    required this.colorPrimario, 
    required this.colorSecundario
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index;
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red, this.slides[0].clipBehavior.index
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(slides.length, (index) => _Dot(index: index, colorPrimario: colorPrimario, colorSecundario: colorSecundario,)) // opcion 1
        // children: slides.asMap().entries.map((widget) => _Dot(index: widget.key)).toList(), // opcion 2.. widget.key es el index iterable

        //  const [ 
        //   _Dot(index: 0),
        //   _Dot(index: 1),
        //   _Dot(index: 2), 
        // ],

      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;
  const _Dot({
    Key? key, 
    required this.index, 
    required this.colorPrimario, 
    required this.colorSecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderModelProvider = Provider.of<SliderModelProvider>(context);
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: sliderModelProvider.currentPage.round() == index ? colorPrimario : colorSecundario,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({
    Key? key, 
    required this.slides
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  // al usar una PageView() se tiene acceso al PageviewController que permite ver en que pagina se encuentra
  final pageViewController = new PageController();
  @override
  void initState() {
    pageViewController.addListener(() {
      // print('jean pagina: ${pageViewController.page}');
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
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      )
    );
  }
}

class _Slide extends StatelessWidget { 
  final Widget slide;
  
  const _Slide({
    Key? key, 
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide
    );
  }
}