import 'package:diseno_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: <Widget>[
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow())
          ],
        ) 
    );
  }
}

class MiSlideshow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Slideshow(
      //puntosArriba: true,
      bulletPrimario: 10,
      bulletSecundario: 5,
      colorPrimario: Colors.purple[200],
      colorSecundario: Colors.white,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}