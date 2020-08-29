import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida;
  TextEditingController _controllerTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _salvarArquivo();

    print('Itens: ' + _listaTarefas.toString());

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de tarefas'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: _criarItemLista,
                ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Adicionar Tarefa'),
                      content: TextField(
                        controller: _controllerTarefa,
                        decoration: InputDecoration(
                          labelText: 'Digite sua tarefa',
                        ),
                        onChanged: (text) {},
                      ),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancelar')),
                        FlatButton(
                            onPressed: () {
                              _salvarTarefa();
                              Navigator.pop(context);
                            },
                            child: Text('Salvar')),
                      ],
                    );
                  });
            }),
      ),
    );
  }

  Widget _criarItemLista(context, index) {
//    final item = _listaTarefas[index]['titulo'];

    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
//      direction: DismissDirection.endToStart,
      direction: DismissDirection.horizontal,
      onDismissed: (direction){

//        Recuperar ultimo item da lista
      _ultimaTarefaRemovida = _listaTarefas[index];

//        Remove item da lista
      _listaTarefas.removeAt(index);
      _salvarArquivo();

//      snackbar
      final snackbar = SnackBar(
        duration: Duration(seconds: 5),
          content: Text('Tarefa removida'),
        action: SnackBarAction(
          label: "Dsfazer",
          onPressed: (){
            setState(() {
            _listaTarefas.insert(index, _ultimaTarefaRemovida);
            });

            _salvarArquivo();
          },
        ),
      );

      Scaffold.of(context).showSnackBar(snackbar);

      },
        secondaryBackground: Container(
          padding: EdgeInsets.all(16),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete,
                color: Colors.white,)
            ],
          ),
        ),
      background: Container(
        padding: EdgeInsets.all(16),
        color: Colors.red,
        child: Row(
//          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete,
            color: Colors.white,)
          ],
        ),
        ),
      child:
      CheckboxListTile(
        value: _listaTarefas[index]['realizada'],
        onChanged: (values) {
          setState(() {
            _listaTarefas[index]['realizada'] = values;
          });
          _salvarArquivo();
        },
        title: Text(_listaTarefas[index]['titulo']),
      ));
  }


  _getFile() async {
    final Directory diretorio = await getApplicationDocumentsDirectory();
    print('caminho:' + diretorio.path);
    return File('${diretorio.path}/dados.json');
  }

  @override
  initState() {
    super.initState();

    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    //    criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa['titulo'] = textoDigitado;
    tarefa['realizada'] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });

    _salvarArquivo();
    _controllerTarefa.text = '';
  }

  Future<File> _salvarArquivo() async {
    var arquivo = await _getFile();

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();

      arquivo.readAsString();
    } catch (e) {
      print("Erro: " + e.toString());
    }
  }
}
