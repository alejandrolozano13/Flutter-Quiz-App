import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String texto; // é aqui onde vamos usar o texto que vem do outro arquivo.
  Questao(this.texto); // aqui é onde referenciamos o campo texto p/ receber o valor.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}