import 'package:flutter/material.dart';
//Creo mi propio widgets en este caso con un container, 

//cuadrado
class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}
//bordes inferiores izquierda y derecha redondeados
class HeaderBorderRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB), //al meter el Boxdecoration el color va dentro
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70),
                                        bottomRight: Radius.circular(70))
      ),
    );
  }
}
//diseño con CustomPainter
class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),  
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override                  //toma la dimensiones de height y del whidth del container donde lo se hubique
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint(); //esto viene a ser el lápiz que vamos a utilizar para pintar
    //propiedades que le damos a la variable lapiz
    lapiz.color =       Color(0xff615AAB); // color del lápiz
    lapiz.style =       PaintingStyle.fill; //stroke son estilo de borde, es estilo de relleno es fill
    lapiz.strokeWidth = 2; //ancho del lápiz
    final path = Path();
    //Que zona vamos a dibujar con la variable lapiz
    path.moveTo(0, size.height*0.5);  // posicionamos el inicio en 0 que sería la parte de izquierda de la pantalla.
                                      // en la posición media de alto de la pantalla.
    path.lineTo(size.width, size.height*0.40);//Pintamos desde el punto de la izquierda en que nos encontramos pasamos hata el otro extremo
                                             // derecho de la pantalla.
    path.lineTo(size.width, 0); // trazamos ahora desde la mitad derecha hasta arriba derecha de la pantalla
    path.lineTo(0, 0); // trazamos desde la derecha hasta el otro extremo iquierdo
    path.lineTo(0, size.height*0.5); //trazamos desde arriba a la izquierda hasta la mitad de la pantalla de alto.

    canvas.drawPath(path, lapiz); // pintamo la linea del del trazo de la variable lapiz

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Headertriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianguloPaiter(),
      ),  
    );
  }
}

class _HeaderTrianguloPaiter extends CustomPainter {
  @override                
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();    
    lapiz.color =       Color(0xff615AAB); 
    lapiz.style =       PaintingStyle.fill; 
    lapiz.strokeWidth = 20; 
    final path = Path();
    path.moveTo(0,0);  
    path.lineTo(size.width,size.height*1);
    path.lineTo(size.width, size.height*0); 
    
    canvas.drawPath(path, lapiz); 

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Headertriangulo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianguloPaiter1(),
      ),  
    );
  }
}

class _HeaderTrianguloPaiter1 extends CustomPainter {
  @override                
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();    
    lapiz.color =       Color(0xff615AAB); 
    lapiz.style =       PaintingStyle.fill;
    lapiz.strokeWidth = 15; 
    final path = Path(); 
    
    path.lineTo(0,size.height*0.35);
    path.lineTo(size.width*0.5, size.height*0.45); 
    path.lineTo(size.width, size.height*0.35); 
    path.lineTo(size.width, 0); 
    canvas.drawPath(path, lapiz); 

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class HeaderCurvoPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),  
    );
  }
}
class _HeaderCurvoPainter extends CustomPainter {
  @override                
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();    
    lapiz.color =       Color(0xff615AAB); 
    lapiz.style =       PaintingStyle.fill;
    lapiz.strokeWidth = 15; 
    final path = Path(); 
    
    path.lineTo(0,size.height*0.25);
    //damos curvatura a la linea
    path.quadraticBezierTo(size.width*0.50, size.height*0.60, size.width*1,size.height*0.25); //las dos últimas coordenadas aputan al final de la línea
    path.lineTo(size.width*1,size.height*0);
    canvas.drawPath(path, lapiz); 

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderOlaPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderOlaPainter(),
      ),  
    );
  }
}
class _HeaderOlaPainter extends CustomPainter {
  @override                
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();    
    lapiz.color =       Color(0xff615AAB); 
    lapiz.style =       PaintingStyle.fill;
    lapiz.strokeWidth = 15; 
    final path = Path(); 
    
    path.lineTo(0,size.height*0.25);
    //damos curvatura a la linea
    path.quadraticBezierTo(size.width*0.25, size.height*0.30,size.width*0.5,size.height*0.25); //las dos últimas coordenadas aputan al final de la línea
    path.quadraticBezierTo(size.width*0.75, size.height*0.20,size.width,size.height*0.25);
    path.lineTo(size.width,0);
    canvas.drawPath(path, lapiz); 

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderOlaPainter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderOlaPainter1(),
      ),  
    );
  }
}
class _HeaderOlaPainter1 extends CustomPainter {
  @override                
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();    
    lapiz.color =       Color(0xff615AAB); 
    lapiz.style =       PaintingStyle.fill;
    lapiz.strokeWidth = 15; 
    final path = Path(); 
    path.moveTo(1,size.height*25);
    path.lineTo(0,size.height*0.75);
    //damos curvatura a la linea
    path.quadraticBezierTo(size.width*0.25, size.height*0.85,size.width*0.5,size.height*0.75); //las dos últimas coordenadas aputan al final de la línea
    path.quadraticBezierTo(size.width*0.75, size.height*0.65,size.width,size.height*0.75);
    path.lineTo(size.width,size.height);
    canvas.drawPath(path, lapiz);  

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderOlaGradientePainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //debemos dar al container todo el alto del dispositivo y..
      width:  double.infinity, //todo el ancho del dispositivo
      //color:  Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderOlaGradientePainter(),
      ),  
    );
  }
}
class _HeaderOlaGradientePainter extends CustomPainter {
  @override                
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(150.0,150.0),
      radius: 180
    );
    
    final Gradient gradiente = new LinearGradient(
      //begin: Alignment.topCenter,
      //end: Alignment.bottomCenter,
      colors:<Color>[
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
      ],
      stops: [
        0.4,
        0.5,
        1.0
      ]
      );
    
    final lapiz= new Paint()..shader =   gradiente.createShader(rect);
    lapiz.style =       PaintingStyle.fill;
    lapiz.strokeWidth = 15; 
    final path = Path(); 
    path.moveTo(1,size.height*25);
    path.lineTo(0,size.height*0.75);
    //damos curvatura a la linea
    path.quadraticBezierTo(size.width*0.25, size.height*0.85,size.width*0.5,size.height*0.75); //las dos últimas coordenadas aputan al final de la línea
    path.quadraticBezierTo(size.width*0.75, size.height*0.65,size.width,size.height*0.75);
    path.lineTo(size.width,size.height);
    canvas.drawPath(path, lapiz);  

  
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}