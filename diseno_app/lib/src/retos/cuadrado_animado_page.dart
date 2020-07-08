import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  //animaciones
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;
  @override
  void initState() {
    // Inicializar
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));
        //damos una duración de cuatro segundo y medio
    // Movimiento de las variables
    //eje X positivo es izquierda    eje  Y
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
    //Empezamos en su posición inicial y termina 100 px de la pantalla hacia la derecha
        parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));
    //intrervalo de entrada y salida, rango 0 inicio a 1 que es fin 
    //entramos en 0 y salimos en el primer cuarto de la animación
    
    //Empezamos en la posición última y termina -100 px de la pantalla hacia arriba en positivo es hacia abajo
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
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
              moverDerecha.value + moverIzquierda.value,
              moverArriba.value + moverAbajo.value,
            ),
            child: child);
      },
    );
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
