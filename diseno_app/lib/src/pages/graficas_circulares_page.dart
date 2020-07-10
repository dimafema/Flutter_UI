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
        body: Center(
            child: Container(
                width: 400,
                height: 400,
                //color: Colors.red,
                child: RadialProgress(porcentaje: porcentaje)
                //       child: Text(
                //   '$porcentaje %',
                //   style: TextStyle(fontSize: 50.0),
                // ),
                //     ))
                )));
  }
}
