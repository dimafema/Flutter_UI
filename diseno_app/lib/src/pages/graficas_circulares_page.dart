import 'package:flutter/material.dart';
import 'package:diseno_app/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += 10.0;
              if (porcentaje > 100.0) {
                porcentaje = 0.0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    colorPrimario: Colors.blue,
                    colorSecundario: Colors.purple,
                  ),
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    colorPrimario: Colors.red,
                    colorSecundario: Colors.green,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    colorPrimario: Colors.pink,
                    colorSecundario: Colors.blue,
                  ),
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    colorPrimario: Colors.purple,
                    colorSecundario: Colors.red,
                  ),
                ])
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSecundario;
  const CustomRadialProgress(
      {@required this.porcentaje,
      @required this.colorPrimario,
      @required this.colorSecundario});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        height: 170,
        //color: Colors.red,
        child: RadialProgress(
          porcentaje: porcentaje,
          colorPrimario: this.colorPrimario,
          colorSecundario: this.colorSecundario,
          grosorCirculo: 2,
          grosorAvance: 5,
        )
        //       child: Text(
        //   '$porcentaje %',
        //   style: TextStyle(fontSize: 50.0),
        // ),
        //     ))
        );
  }
}
