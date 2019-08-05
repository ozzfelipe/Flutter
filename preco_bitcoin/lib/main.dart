import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preço Bitcoin',
      home: home(),
    ));

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  var _precoBitcoin = '0,00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/bitcoin.png'),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'R\$ ' + '$_precoBitcoin',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            RaisedButton(
              onPressed: _recuperarPreco,
              color: Colors.orange,
              child: Text(
                'Atualizar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _recuperarPreco() async{

    var urlBitcoinApi = 'https://blockchain.info/ticker';
    http.Response response = await http.get(urlBitcoinApi);

    Map<String, dynamic> retorno = json.decode(response.body);
    _precoBitcoin = retorno['BRL']['buy'].toString();

    setState(() {
    _precoBitcoin = _precoBitcoin.replaceAll('.', ',');
    });

  }

}
