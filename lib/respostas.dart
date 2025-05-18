import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {

  final String resposta;
  final void Function() quandoSelecionado;

  Respostas(this.resposta, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        child: Text(resposta),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[200],
          foregroundColor: Colors.black, // isso serve para definir a cor do texto
          textStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
          elevation: 5 // isso aqui da sombra
        ),
      ),
    );
  }
}