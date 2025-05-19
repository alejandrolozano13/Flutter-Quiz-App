import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacaoTotal, this.reiniciarQuestionario);

  String get fraseResultado {
    return pontuacaoTotal < 8
        ? 'Reprovado'
        : pontuacaoTotal < 12
        ? 'Você é aceitável'
        : pontuacaoTotal < 16
        ? 'Foi bem!'
        : 'THE LAST OF LAMINE YAMAAAAAL';
  }

  Color get colorPontuacao {
    return pontuacaoTotal < 8
        ? Colors.red.shade400
        : pontuacaoTotal < 12
        ? Colors.black
        : pontuacaoTotal < 16
        ? Colors.green.shade100
        : Colors.green.shade900;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 169, 221, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Pontuação: $pontuacaoTotal",
            style: TextStyle(fontSize: 20, color: colorPontuacao),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: reiniciarQuestionario,
            child: Text("Reiniciar"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
              textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
    // return Center(
    //   child: Text(
    //     "Parabéns!",
    //     style: TextStyle(fontSize: 28)
    //     ),
    // );
  }
}
