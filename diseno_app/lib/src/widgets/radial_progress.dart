import 'package:flutter/material.dart';
import 'dart:math';

import 'dart:ui';

class RadialProgress extends StatefulWidget {
  final porcentaje;

  const RadialProgress({Key key, this.porcentaje});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          //utilizamos el ancho y el alto maximo del container
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress((widget.porcentaje - diferenciaAnimar)+ (diferenciaAnimar* controller.value)),
          ),
        );
      },
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