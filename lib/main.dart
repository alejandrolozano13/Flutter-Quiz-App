import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {"texto": 'Preto', "pontuacao": 10},
        {"texto": 'Vermelho', "pontuacao": 5},
        {"texto": 'Verde', "pontuacao": 3},
        {"texto": 'Branco', "pontuacao": 0}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 0},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 10}
      ],
    },
    {
      'texto': 'Qual é o seu jogador favorito?',
      'respostas': [
        {'texto': 'Lionel Messi', 'pontuacao': 10},
        {'texto': 'Andrés Iniesta', 'pontuacao': 5},
        {'texto': 'Lamine Yamal', 'pontuacao': 3},
        {'texto': 'Cristiano Ronaldo', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}