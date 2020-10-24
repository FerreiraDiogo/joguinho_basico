import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final Function() onSelect;

  Respostas(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: this.onSelect,
        child: Text(this.texto),
      ),
    );
  }
}
