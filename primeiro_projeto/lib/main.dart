import 'dart:math';

import 'package:flutter/material.dart';

List<String> frases = ["Frase 1", "Frase 2", "Frase 3", "Frase 4"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  String _frase = "Clique abaixo para gerar uma frase!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases do dia"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
//        width: double.infinity,
            /*decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.amber)
          ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/logo.png'),
                Text(
                  _frase,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    geraFrase();
                  },
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ));
  }

  void geraFrase() {
    int numero = Random().nextInt(frases.length);

    setState(() {
      _frase = frases[numero];
    });
  }
}
