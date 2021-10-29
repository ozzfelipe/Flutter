import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_clone/model/Video.dart';

const CHAVE_YOUTUBE_API = '';
const ID_CANAL = '';
const URL_BASE = '';


class Api {
  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + 'search'
          '?part=snippet'
          '&type=video'
          '&maxResults=20'
          '&order=date'
          '&key=$CHAVE_YOUTUBE_API'
          '&channelId=$ID_CANAL'
          '&q=$pesquisa'
    );

    if(response.statusCode == 200){


      Map<String, dynamic> dadosJson = jsonDecode(response.body);

      List<Video> videos = dadosJson['items'].map<Video>(
          (map){
            return Video.fromJson(map);
//          return Video.converterJson(map);
          }
      ).toList();

      return videos;

      /*
      for( var video in dadosJson['items']){
      print('Resultado ' + video.toString());
      }
*/

    }else{

    }

  }
}
