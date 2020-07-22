import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  Slideshow(
      {@required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _SliderhowModel(),
        child: SafeArea(
          child: Center(child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderhowModel>(context)._coloPrimario =
                  this.colorPrimario;
              Provider.of<_SliderhowModel>(context)._colorSecudario =
                  this.colorSecundario;
              Provider.of<_SliderhowModel>(context)._bulletPrimario =
                  this.bulletPrimario;
              Provider.of<_SliderhowModel>(context)._bulletSecundario =
                  this.bulletSecundario;
              return CrearEstructura(
                puntosArriba: puntosArriba,
                slides: slides,
              );
            },
          )),
        ));
  }
}

class CrearEstructura extends StatelessWidget {
  const CrearEstructura({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      if (this.puntosArriba) _Dots(this.slides.length),
      Expanded(child: _Slides(this.slides)),
      if (!this.puntosArriba) _Dots(this.slides.length),
    ]);
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      //color: Colors.red,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              this.totalSlides,
              (i) => _Dot(
                    i,
                  ))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssMoldel = Provider.of<_SliderhowModel>(context);
    double tamano = 0;
    Color color;
    if (ssMoldel.currentPage >= index - 0.5 &&
        ssMoldel.currentPage < index + 0.5) {
      tamano = ssMoldel.bulletPrimario;
      color = ssMoldel.colorPrimario;
    } else {
      tamano = ssMoldel._bulletSecundario;
      color = ssMoldel._colorSecudario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SliderhowModel>(context, listen: false).currentPage =
          pageViewController.page;
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
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: slide);
  }
}

class _SliderhowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _coloPrimario = Colors.blue;
  Color _colorSecudario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;
  set currentPage(double pagina) {
    this._currentPage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => this._coloPrimario;
  set colorPrimario(Color color) {
    this._coloPrimario = color;
    //notifyListeners();
  }

  Color get colorSegundario => this._colorSecudario;
  set colorSecundario(Color color) {
    this._coloPrimario = color;
    //notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet) {
    this._bulletPrimario = bullet;
    //notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet) {
    this._bulletSecundario = bullet;
    //notifyListeners();
  }
}
