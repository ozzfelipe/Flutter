import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alcool ou Gasolina',
      home: homeStateful(),
    ));

class homeStateful extends StatefulWidget {
  @override
  _homeStatefulState createState() => _homeStatefulState();
}

class _homeStatefulState extends State<homeStateful> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _textResultado = '';
  var _titulo = 'Alcool ou gasolina';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(_titulo),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image.asset("images/logo.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Saiba qual a melhor opção para abastecimento do seu veículo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Preço Alcool, ex: 2.20'),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Preço Gasolina, ex: 3.98'),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    controller: _controllerGasolina,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        'Calcular',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: _calcular,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        _textResultado,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))
                ]),
          ),
        ));
  }

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textResultado =
            'Número inválido, digite números maiores que 0 e utilizando (.)';
      });
    } else {
      var resultado = (precoAlcool / precoGasolina);

      if (resultado >= 0.7) {
        setState(() {
          _textResultado = 'Melhor abastecer com gasolina!';
        });
      } else {
        setState(() {
          _textResultado = 'Melhor abastecer com alcool!';
        });
      }
    }

    _limparCampos();
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }
}
