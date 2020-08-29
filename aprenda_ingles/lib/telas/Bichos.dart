import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Bichos extends StatefulWidget {
  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {

  AudioCache _audioCache = AudioCache(prefix: 'audios/');

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
            children: <Widget>[
              GestureDetector(
                onTap: (){_executarAudio('cao');},
                child: Image.asset('assets/images/cao.png'),
              ),
              GestureDetector(
                onTap: (){_executarAudio('gato');},
                child: Image.asset('assets/images/gato.png'),
              ),
              GestureDetector(
                onTap: (){_executarAudio('leao');},
                child: Image.asset('assets/images/leao.png'),
              ),
              GestureDetector(
                onTap: (){_executarAudio('macaco');},
                child: Image.asset('assets/images/macaco.png'),
              ),
              GestureDetector(
                onTap: (){_executarAudio('ovelha');},
                child: Image.asset('assets/images/ovelha.png'),
              ),
              GestureDetector(
                onTap: (){_executarAudio('vaca');},
                child: Image.asset('assets/images/vaca.png'),
              ),
      ],
    );
  }

  initState(){
    _audioCache.loadAll([
      'cao.mp3','gato.mp3','leao.mp3','macaco.mp3','ovelha.mp3','vaca.mp3'
    ]);
    super.initState();
  }


  _executarAudio(String nomeAudio){
    _audioCache.play(nomeAudio + '.mp3');
  }
}
