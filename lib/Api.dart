import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';


const CHAVE_YOUTUBE_API = "AIzaSyBu3-qbsVaAjWCqEhtWrgH16_nkyD7av6s";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>>pesquisar(String pesquisa)async{

    http.Response response = await http.get(
        URL_BASE + "search"
        //passando os parâmetros, sometene o primeiro recebe ?
            "?part=snippet"
            "&type=video"
            "&maxResults=40"
            "&order=date"
        //Sem a chave não é possivél fazer a requisição
            "&key=$CHAVE_YOUTUBE_API"
        /*Parametro opcional, podemos carregar videos de um determinado canal
        * a não utilização, irá trazer dados diretamente do YT*/
            //"&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    //validando se a pesquisa ocorreu com sucesso
    if( response.statusCode == 200){
      //convertendo o resultado da requisição para um map
      Map<String, dynamic> dadosJson = json.decode(response.body);

      //criando uma lista de videos
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

      //outra forma de obter o resultado desejado
      /*
      for(var video in dadosJson["items"]){
        print("resultado : " + video.toString());

      }

       */

    }

  }

}