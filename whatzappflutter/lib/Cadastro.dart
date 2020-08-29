import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatzappflutter/Home.dart';
import 'package:whatzappflutter/RouteGenerator.dart';
import 'package:whatzappflutter/model/Usuario.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
//  Controladores
  TextEditingController _controllerNome = TextEditingController(text: 'Felipe');
  TextEditingController _controllerEmail = TextEditingController(text: 'ozzfelipe@gmail.com');
  TextEditingController _controllerSenha = TextEditingController(text: '123456');
  String _msgErro = "";

//    Firebase
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    'assets/images/usuario.png',
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 3, 16),
                      hintText: 'Nome',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 3, 16),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                TextField(
                  obscureText: true,
                  controller: _controllerSenha,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 3, 16),
                    hintText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      _validarCampos();
                    },
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    _msgErro,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _abrirTelaHome(){

    Navigator.pushNamedAndRemoveUntil(context, RouteGenerator.ROTA_HOME, (_)=>false);

  }

  _cadastrarUsuario(Usuario usuario) {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: usuario.email, password: usuario.senha
    ).then((firebaseUser){

//      Salvar dados do usuario
    Firestore firestore = Firestore.instance;
    firestore.collection('usuarios')
    .document(firebaseUser.user.uid)
    .setData(usuario.toMap());

      setState(() {
        _msgErro = 'Sucesso ao cadastrar usúario';
      });

      _abrirTelaHome();

    }).catchError((onError){
      setState(() {
        _msgErro = 'Erro ao cadastrar usúario, verifique os campos e tente novamente';
      });
    });
  }

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (email.contains('@') && email.contains('.com')) {
        if (senha.length >= 6 && !senha.contains(' ')) {
          setState(() {
            _msgErro = '';
          });

          Usuario usuario = Usuario();

          usuario.nome = _controllerNome.text;
          usuario.email = _controllerEmail.text;
          usuario.senha = _controllerSenha.text;

          _cadastrarUsuario(usuario);
        } else {
          setState(() {
            _msgErro = 'Sua senha deve conter no minímo 6 caracteres';
          });
        }
      } else {
        setState(() {
          _msgErro = 'Digite um email válido';
        });
      }
    } else {
      setState(() {
        _msgErro = 'Preencha o nome';
      });
    }
  }
}
