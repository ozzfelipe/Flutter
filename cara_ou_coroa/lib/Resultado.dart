import 'package:flutter/material.dart';

import 'main.dart';

class Resultado extends StatefulWidget {
  int ladoMoeda;

  Resultado(this.ladoMoeda);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    String imageMoeda;

    if (widget.ladoMoeda == 0) {
      imageMoeda = 'images/moeda_cara.png';
    } else {
      imageMoeda = 'images/moeda_coroa.png';
    }
    return Scaffold(
        backgroundColor: Color(0xff61bd86),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(imageMoeda),
              Padding(
                  padding: EdgeInsets.only(top: 10, right: 60, left: 60),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('images/botao_voltar.png'),
                  ))
            ],
          ),
        ));
  }
}
