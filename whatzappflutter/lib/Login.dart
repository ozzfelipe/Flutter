import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatzappflutter/Cadastro.dart';
import 'package:whatzappflutter/Cadastro.dart';
import 'package:whatzappflutter/RouteGenerator.dart';

import 'Home.dart';
import 'model/Usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail =
      TextEditingController(text: 'ozzfelipe@gmail.com');
  TextEditingController _controllerSenha =
      TextEditingController(text: '123456');
  String _msgErro = "";

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'assets/images/logo.png',
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
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
                  controller: _controllerSenha,
                  obscureText: true,
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
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RouteGenerator.ROTA_CADASTRO),
                    child: Text(
                      'Não tem conta? cadastr-se!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _msgErro,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _abrirTelaHome() {
    Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
  }

  _loginUsuario(Usuario usuario) {
    _firebaseAuth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      _abrirTelaHome();
    }).catchError((error) {
      setState(() {
        _msgErro =
            'Erro ao autenticar o usuário, verifique e-mail e senha e tente novamente';
      });
    });
  }

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.contains('@') && email.contains('.com')) {
      if (senha.isNotEmpty) {
        setState(() {
          _msgErro = '';
        });

        Usuario usuario = Usuario();
        usuario.email = _controllerEmail.text;
        usuario.senha = _controllerSenha.text;

        _loginUsuario(usuario);
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
  }

  Future _verificarUsuarioLogado() async {
//    _firebaseAuth.signOut();

    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      _abrirTelaHome();
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();

    super.initState();
  }
}
