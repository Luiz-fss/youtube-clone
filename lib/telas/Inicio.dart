import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {

  /*Criando um contrutor para receber o parâmetro da tela home
  * sempre que for pesquisado algo, o valor da pesquisa será passado
  * para esta tela*/
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){

      Api api = Api();
      return api.pesquisar(pesquisa);


  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (contex, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){

              return ListView.separated(
                  itemBuilder: (context, index){
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];

                    return GestureDetector(
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE_API,
                            videoId: video.id,
                        autoPlay: true,
                          fullScreen: true,
                        );
                      },


                      child: Column(
                        children: <Widget>[
                          Container(
                            /*como as imgs vão ficar de fundo
                          * foi definido uma altura para elas */
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  /*o fit define como a img vai ficar
                              * dentro do container*/
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.imagem),
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
                  //poderiamos fazer separações diferentes baseado no index
                  separatorBuilder: (contex, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length);

            }else{
              Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
          break;

        }
      },
    );
  }
}
