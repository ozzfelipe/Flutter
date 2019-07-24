import 'package:flutter/material.dart';

class jogo extends StatefulWidget {
  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:32,bottom: 16),
            child: Text(
              'Escolha do app:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset('padrao.png')
        ],
      ),
    );
  }
}
