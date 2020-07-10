import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //hemos centrado el cuadrado tanto en vertical como horizontal respecto la pantalla
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

//Extraemos el widget y le damos un stateful por que tiene movimientos
class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  //creamos las variable de las animaciones
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;
  Animation<double> moverDerecha1;
  Animation<double> moverArriba1;
<<<<<<< HEAD
  Animation<double> moverCentro;
=======
>>>>>>> 88bffedc04a2b9de0ba513335e9657e019296ed1
  @override
  void initState() {
    // Inicializamos la animación
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    moverDerecha = Tween(begin: 0.0, end: 145.0).animate(CurvedAnimation(
        parent: controller,
<<<<<<< HEAD
        curve: Interval(0.0, 0.1428, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: -274.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.1428, 0.2857, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -290.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.2857, 0.4285, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 575.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.4285, 0.5713, curve: Curves.bounceOut)));

    moverDerecha1 = Tween(begin: 0.0, end: 290.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5713, 0.7141, curve: Curves.bounceOut)));

    moverArriba1 = Tween(begin: 0.0, end: -300.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.7141, 0.8569, curve: Curves.bounceOut)));

    moverCentro = Tween(begin: 0.0, end: -145.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.8569, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
=======
        curve: Interval(0.0, 0.1666, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: -274.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.1666, 0.3333, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -290.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.3333, 0.5, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 575.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.6665, curve: Curves.bounceOut)));

    moverDerecha1 = Tween(begin: 0.0, end: 290.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.6665, 0.8331, curve: Curves.bounceOut)));
    
    moverArriba1 = Tween(begin: 0.0, end: -274.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.8331, 1.0, curve: Curves.bounceOut)));
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        //controller.reset();
>>>>>>> 88bffedc04a2b9de0ba513335e9657e019296ed1
      }
    });
  }

  @override
  void dispose() {
    // cerrar el controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
            offset: Offset(
<<<<<<< HEAD
              moverDerecha.value +
                  moverIzquierda.value +
                  moverDerecha1.value +
                  moverCentro.value,
=======
              moverDerecha.value + moverIzquierda.value + moverDerecha1.value,
>>>>>>> 88bffedc04a2b9de0ba513335e9657e019296ed1
              moverArriba.value + moverAbajo.value + moverArriba1.value,
            ),
            child: child);
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Creamos el container con las dimensiones y le damos el color
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
