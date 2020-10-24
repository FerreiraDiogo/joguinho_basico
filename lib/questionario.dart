import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'questao.dart';
import 'respostas.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final void Function(int pontuacao) responder;
  final List<Map<String, Object>> perguntas;

  Questionario({
    @required this.perguntaSelecionada,
    @required this.responder,
    @required this.perguntas,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]["respostas"]
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]["texto"]),
        ...respostas.map(
            (e) => Respostas(e["texto"], () => {responder(e["pontuacao"])}))
      ],
    );
  }
}
