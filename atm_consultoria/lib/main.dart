import 'package:atm_consultoria/telaEmpresa.dart';
import 'package:atm_consultoria/telaServico.dart';
import 'package:atm_consultoria/telaCliente.dart';
import 'package:atm_consultoria/telaContato.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Consultoria',
      home: MyHomePage(title: 'ATM Consultoria'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,

        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60),
            child: Image.asset('images/logo.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: _abrirEmpresa,
                child:
                Padding(padding: EdgeInsets.only(top: 0),
                  child: Image.asset('images/menu_empresa.png'),
                ),
              ),
              GestureDetector(
                onTap: _abrirServico,
                child: Padding(padding: EdgeInsets.only(top: 0),
                  child: Image.asset('images/menu_servico.png'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: _abrirCliente,
                child: Padding(padding: EdgeInsets.only(top: 30),
                  child: Image.asset('images/menu_cliente.png'),
                ),
              ),
              GestureDetector(
                  onTap: _abrirContato,
                  child: Padding(padding: EdgeInsets.only(top: 30),
                    child: Image.asset('images/menu_contato.png'),
                  ) ,
              )
            ],
          ),
        ],
      ),
    );
  }

  void _abrirEmpresa(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => telaEmpresa()));
  }
  void _abrirServico(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => telaServico()));
  }
  void _abrirCliente(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => telaCliente()));
  }
  void _abrirContato(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => telaContato()));
  }

}
