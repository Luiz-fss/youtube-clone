class Video{
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  /*
  trecho de código que recuperaria os dados
  porém ainda não estaria otimizado, para cada novo video seria criado uma nova
  instância e consumiria muita memória
  static converterJson(Map<String, dynamic>json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],

    );
  }

   */

  //factory funciona como static a diferença é que o retorno será apenas de um obj
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],

    );
  }


}