import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  @required
  final pontuacao;

  @required
  final Function() reiniciar;

  String get fraseResultado {
    if (pontuacao == 30) {
      return "Você Acertou Todas as Questões e Marcou ${pontuacao} Pontos!";
    } else {
      return "Sua Pontuação foi de ${pontuacao} Pontos";
    }
  }

  Resultado({this.pontuacao, this.reiniciar});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Center(
          child: Text(
        "Parabens!",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 16,
            ),
          )
        ],
      ),
      FlatButton(
        onPressed: reiniciar,
        child: Text(
          "Reiniciar?",
          style: TextStyle(color: Colors.blue[200], fontSize: 16),
        ),
      )
    ]));
  }
}
