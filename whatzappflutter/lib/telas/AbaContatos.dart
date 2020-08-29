import 'package:flutter/material.dart';
import 'package:whatzappflutter/model/Conversa.dart';

class AbaContatos extends StatefulWidget {
  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  List<Conversa> listaConversas = [
    Conversa('Ana Clara', 'Olá, tudo bem?',
        'https://firebasestorage.googleapis.com/v0/b/whatzappclone-d7b69.appspot.com/o/Perfil%2Fperfil1.jpg?alt=media&token=95d53b1b-535d-4fb8-b105-8dcde8ac5a16'),
    Conversa('José', 'Olá, tudo bem?',
        'https://firebasestorage.googleapis.com/v0/b/whatzappclone-d7b69.appspot.com/o/Perfil%2Fperfil2.jpg?alt=media&token=d3f70df5-4568-4c9e-bc19-2d901c76fe16'),
    Conversa('Marco Antonio', 'Olá, tudo bem?',
        'https://firebasestorage.googleapis.com/v0/b/whatzappclone-d7b69.appspot.com/o/Perfil%2Fperfil3.jpg?alt=media&token=3173c70b-0818-4caf-8d7d-53561778220e'),
    Conversa('Marisete', 'Olá, tudo bem?',
        'https://firebasestorage.googleapis.com/v0/b/whatzappclone-d7b69.appspot.com/o/Perfil%2Fperfil4.jpg?alt=media&token=5ab0de1d-04ca-4ef8-a706-5cb4737663fb'),
    Conversa('Pamela', 'Olá, tudo bem?',
        'https://firebasestorage.googleapis.com/v0/b/whatzappclone-d7b69.appspot.com/o/Perfil%2Fperfil5.jpg?alt=media&token=d54ce08a-982f-45f6-9b38-f0881f8a686e'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, index) {
          Conversa conversa = listaConversas[index];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              maxRadius: 28,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(conversa.caminhoFoto),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          );
        });
  }
}
