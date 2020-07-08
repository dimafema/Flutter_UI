
//HE IMPORTADO EL PAQUETE DE MI ARCHIVO
import 'package:diseno_app/src/retos/cuadrado_animado_diego.dart';
import 'package:flutter/material.dart';


//import 'package:diseno_app/src/pages/animaciones_pages.dart';
//import 'package:diseno_app/src/pages/headers_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños app',
        home: CuadradoAnimadoPage());
  }
}
