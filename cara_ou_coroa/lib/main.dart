import 'dart:math';

import 'package:flutter/material.dart';

import 'Resultado.dart';

void main() => runApp(MaterialApp(
      title: 'Cara ou coroa',
      home: home(),
    ));

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff61bd86),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/logo.png'),
              Padding(
                padding: EdgeInsets.only(top:10, right: 60,left: 60),
                child: GestureDetector(
                  onTap: _abrirResultado,
                  child: Image.asset('images/botao_jogar.png'),
                ),
              )
            ],
          ),
        ));
  }


  void _abrirResultado(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Resultado(_calcularResultado())));
  }

  int _calcularResultado(){
    var lado = Random().nextInt(2);
    return lado;
  }
}
