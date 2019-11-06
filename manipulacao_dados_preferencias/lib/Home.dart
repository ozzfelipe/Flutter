import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _textoSalvo = 'Nada salvo';
  TextEditingController _controllerCampo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manipulação de dados'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_textoSalvo,
                style: TextStyle(fontSize: 24),
              ),
              TextField(
                controller: _controllerCampo,
                keyboardType: TextInputType.text,
                decoration:
                InputDecoration(labelText: 'Digite algo'),
              ),
              Row(children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: _salvar,
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white,
                        fontSize: 16,),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: _recuperar,
                  child: Text(
                    'Ler',
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: _remover,
                  child: Text(
                    'Remover',
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                )
              ])
            ],
          ),
        ));
  }

  void _salvar() async {

    var valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', valorDigitado);

    print('operação salvar: $valorDigitado' );
  }

  void _recuperar() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {

      if( _textoSalvo != null){

    _textoSalvo = prefs.getString('nome');
      }else{
        _textoSalvo = 'Sem valor';
      }
    });

    print('operação ler: $_textoSalvo' );

  }

  void _remover() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('nome') ;
    setState(() {
      _textoSalvo = 'Nada salvo';
    });

    print('operação apagar: $_textoSalvo' );
  }
}
