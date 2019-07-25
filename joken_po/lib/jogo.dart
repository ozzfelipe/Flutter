import 'dart:math';

import 'package:flutter/material.dart';

class jogo extends StatefulWidget {
  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  var _imageApp = AssetImage('images/padrao.png');
  var _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do app:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => opcaoSelecionada('papel'),
                child: Image.asset(
                  'images/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada('pedra'),
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada('tesoura'),
                child: Image.asset('images/tesoura.png', height: 100),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 16),
            child: Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];

    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];
    alterarImageApp(escolhaApp);

    resultado(escolhaApp, escolhaUsuario);
  }

  void alterarImageApp(String escolhaApp) {
    setState(() {
      switch (escolhaApp) {
        case 'pedra':
          _imageApp = AssetImage('images/pedra.png');
          break;
        case 'papel':
          _imageApp = AssetImage('images/papel.png');
          break;
        case 'tesoura':
          _imageApp = AssetImage('images/tesoura.png');
          break;
      }
    });
  }

  void resultado(escolhaApp, escolhaUsuario) {
    if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel')) {
      setState(() {
        _resultado = 'Você perdeu!';
      });
    } else if (escolhaApp == escolhaUsuario ) {
      setState(() {
        _resultado = 'Empate!';
      });
    } else {
      setState(() {
        _resultado = 'Você venceu!';
      });
    }
  }
}
