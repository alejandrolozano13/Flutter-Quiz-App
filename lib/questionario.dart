import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final bool temPerguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.temPerguntaSelecionada,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    var respostas =
        temPerguntaSelecionada
            ? (perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>>)
                .map((resposta) => Respostas(
                  resposta['texto'].toString(),
                  () => responder(int.parse(resposta['pontuacao'].toString()))
                ))
                .toList()
            : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas,
      ],
    );
  }
}
