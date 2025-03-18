import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(255, 156, 230, 1),
        title: Text(
          'Bem-vindo(a)',
          style: TextStyle(color: Color.fromRGBO(45, 45, 45, 1)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PAGINA\nHOME\nDO\nAPLICATIVO',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
