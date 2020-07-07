//import 'dart:html';

import 'package:flutter/material.dart';

class CuadradroAnimadoPage extends StatefulWidget {
  @override
  _CuadradroAnimadoPageState createState() => _CuadradroAnimadoPageState();
}

class _CuadradroAnimadoPageState extends State<CuadradroAnimadoPage>
    with SingleTickerProviderStateMixin {
  AnimationController contoller;
  //animaciones
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    super.initState();
    //inicializado
    contoller = AnimationController(
        vsync: this, duration: Duration(microseconds: 4500));
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(contoller);
  }

  @override
  void dispose() {
    contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
