import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/respostas.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  final List<Map<String, Object>> perguntas = [
    {
      "texto": "Qual a sua cor favorita?",
      "respostas": [
        {"texto": "preto", "pontuacao": 10},
        {"texto": "vermelho", "pontuacao": 9},
        {"texto": "azul", "pontuacao": 8},
        {"texto": "roxo", "pontuacao": 7},
      ]
    },
    {
      "texto": "Qual seu animal favorito?",
      "respostas": [
        {"texto": "lobo", "pontuacao": 10},
        {"texto": "coelho", "pontuacao": 9},
        {"texto": "macaco", "pontuacao": 8},
        {"texto": "arara", "pontuacao": 7},
      ]
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": [
        {"texto": "joao", "pontuacao": 10},
        {"texto": "maria", "pontuacao": 9},
        {"texto": "luiz", "pontuacao": 8},
        {"texto": "luiza", "pontuacao": 7},
      ]
    }
  ];

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  void reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  Widget build(BuildContext buildContext) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[_perguntaSelecionada]["respostas"]
        : null;

    List<Widget> widgets = temPerguntaSelecionada
        ? respostas
            .map((resposta) => Respostas(
                resposta["texto"], () => {responder(resposta["pontuacao"])}))
            .toList()
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas e Respostas"),
          centerTitle: true,
          // backgroundColor: Color(0xFF),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                responder: responder,
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: perguntas,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciar: reiniciar,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    // TODO: implement createState
    return PerguntaAppState();
  }
}
