<<<<<<< HEAD
//HE IMPORTADO EL PAQUETE DE MI ARCHIVO
import 'package:diseno_app/src/pages/circular_progress_page.dart';
//import 'package:diseno_app/src/retos/cuadrado_animado_diego.dart';
=======

//HE IMPORTADO EL PAQUETE DE MI ARCHIVO
import 'package:diseno_app/src/retos/cuadrado_animado_diego.dart';
>>>>>>> 88bffedc04a2b9de0ba513335e9657e019296ed1
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
        home: CircularProgressPage());
  }
}
