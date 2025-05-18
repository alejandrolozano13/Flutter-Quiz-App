import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {"texto": 'Preto', "nota": 10},
        {"texto": 'Vermelho', "nota": 5},
        {"texto": 'Verde', "nota": 3},
        {"texto": 'Branco', "nota": 0}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu jogador favorito?',
      'respostas': [
        'Lionel Messi',
        'Andrés Iniesta',
        'Lamine Yamal',
        'Cristiano Ronaldo',
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() => _perguntaSelecionada++);
    }

    print('Pergunta respondida');
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body:
            temPerguntaSelecionada
                ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  temPerguntaSelecionada: temPerguntaSelecionada,
                  responder: _responder,
                )
                : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
