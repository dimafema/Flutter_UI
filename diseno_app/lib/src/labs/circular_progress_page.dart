import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentaje = 0.0;
  double nuevoporcentaje = 0.0;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      //print('valor controller: ${controller.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoporcentaje, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
          onPressed: () {
            porcentaje = nuevoporcentaje;
            nuevoporcentaje += 10;
            if (nuevoporcentaje > 100) {
              nuevoporcentaje = 0;
              porcentaje = 0;
            }
            controller.forward(from: 0.0);
            setState(() {});
          }),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    //diseñamos el lápiz del círulo
    final paint = new Paint()
      ..strokeWidth = 4 //grosor
      ..color = Colors.grey //color
      ..style = PaintingStyle.stroke; //relleno

    //Diseñamos el círculo
    final Offset center = new Offset(size.width * 0.5,
        size.height / 2); //me posiciono en el centro del círculo
    final double radio =
        min(size.width * 0.5, size.height * 0.5); //definimos el rádio
    canvas.drawCircle(
        center, radio, paint); //c = Posición, radio y el lapiz que dibujamos

    //diseñamos el lápiz del arco
    final paintArco = new Paint()
      ..strokeWidth = 10 //grosor
      ..color = Colors.pink //color
      ..style = PaintingStyle.stroke; //relleno

    //parte del arco que se debe llenar
    double arcAngle = 2 *
        pi *
        (porcentaje /
            100); //si pi lo multiplicamos por 2 es 360 y si multiplicamos por el último valor es x
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
    //ubicación del circulo
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
