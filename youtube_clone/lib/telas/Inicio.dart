import 'package:flutter/material.dart';
import 'package:youtube_clone/helper/Api.dart';
import 'package:youtube_clone/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _IncioState createState() => _IncioState();
}

class _IncioState extends State<Inicio> {

  _listarVideos(String pesquisa) {

    Api api = Api();
    return api.pesquisar(pesquisa);

  }

  @override
  Widget build(BuildContext context) {

print('pesquisa' + widget.pesquisa);

    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context,snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.hasData){

              return ListView.separated(
                  itemBuilder: (contex,index){

                    List<Video> videos = snapshot.data;

                    Video video = videos[index];

                    return GestureDetector(
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE_API,
                            videoId: video.id,
                        autoPlay: true,
                        fullScreen: true);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.imagem)
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data.length);

            }else{
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }

        }
      },
    );
  }
}

